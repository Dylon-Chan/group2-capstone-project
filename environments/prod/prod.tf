#Creates an AWS security group named ecs_sg within the specified VPC to allow incoming traffic on a specified port (var.image_port) from any source (0.0.0.0/0) and allows all outgoing traffic
resource "aws_security_group" "ecs_sg" {
  vpc_id = var.vpc_id
  name = var.ecs_sg_name
  depends_on = [ aws_security_group.loadbalancer_sg ]
  
  ingress {
    from_port = var.image_port
    to_port = var.image_port
    protocol = "tcp"
    security_groups = [aws_security_group.loadbalancer_sg.id]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

#Defines an Amazon ECS cluster
resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_name
}

#Defines an ECS task definition that specifies how the containers should run
#Use the Fargate launch type and sets resource constraints like CPU and memory
resource "aws_ecs_task_definition" "task" {
  family = "${var.ecs_name}-task"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = var.cpu
  memory = var.memory
  execution_role_arn = var.role_to_assume
  container_definitions = jsonencode([{
    name: "${var.ecs_name}-td",
    image: "${var.image_name}:${var.image_tag}",
    portMappings: [
        {
            containerPort: var.image_port,
            protocol: "tcp"
        }
    ],
    essential: true
}])
}

#Creates an ECS service within the specified cluster. Use the Fargate launch type and depends on the previously defined security group
resource "aws_ecs_service" "service" {
  name = "${var.ecs_name}-service"
  cluster = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  launch_type = "FARGATE"
  depends_on = [ aws_security_group.ecs_sg, aws_lb_listener.front_end ]
  desired_count = 1
  
  network_configuration {
    subnets = var.subnets
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer { //Specifies ALB target group and container port for routing traffic
    target_group_arn = aws_lb_target_group.load_balancer_tg.arn
    container_name   = "${var.ecs_name}-td"
    container_port   = var.image_port
  }
}

# Below for Application Load Balancer

#Creates security group for the ALB to allow incoming traffic on a specified port (var.alb_port) from any source (0.0.0.0/0) and allows all outgoing traffic
resource "aws_security_group" "loadbalancer_sg" {
  vpc_id = var.vpc_id
  name = var.lb_sg_name
  
  ingress {
    from_port = var.alb_port
    to_port = var.alb_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

#Defines ALB target group
resource "aws_lb_target_group" "load_balancer_tg" {
  name     = "group2-lb-tg-${var.env}"
  port     = var.image_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check { //Configure health checks for the target group
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 30
    timeout = 3
    healthy_threshold   = "3"
    unhealthy_threshold = "2"
  }
}

#Creates AWS ALB resources
resource "aws_lb" "loadbalancer" {
  name               = "group2-loadbalancer-${var.env}"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.loadbalancer_sg.id]
  subnets            = var.subnets

  # enable_deletion_protection = true
}

#Defines an ALB listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.loadbalancer.id
  port              = var.alb_port
  protocol          = "HTTP"

  default_action {
    type             = "forward" //To forward incoming requests to the defined target group as default action
    target_group_arn = aws_lb_target_group.load_balancer_tg.id
  }
}