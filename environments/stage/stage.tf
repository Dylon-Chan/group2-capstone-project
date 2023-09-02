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

resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_name
}

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

resource "aws_ecs_service" "service" {
  name = "${var.ecs_name}-service"
  cluster = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  launch_type = "FARGATE"
  depends_on = [ aws_security_group.ecs_sg, aws_lb_listener.front_end ]
  desired_count = 2
  
  network_configuration {
    subnets = var.subnets
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.load_balancer_tg.arn
    container_name   = "${var.ecs_name}-td"
    container_port   = var.image_port
  }
}

# Below for Application Load Balancer

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

resource "aws_lb_target_group" "load_balancer_tg" {
  name     = "group2-lb-tg-${var.env}"
  port     = var.image_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 30
    timeout = 3
    healthy_threshold   = "3"
    unhealthy_threshold = "2"
  }

  stickiness {
    type = "lb_cookie"
    cookie_duration = 86400 # Set the stickiness duration in seconds (e.g. 1 day)
    enabled = true
  }
}

resource "aws_lb" "loadbalancer" {
  name               = "group2-loadbalancer-${var.env}"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.loadbalancer_sg.id]
  subnets            = var.subnets
  enable_deletion_protection = false
  idle_timeout = 300  # Set the timeout in seconds (e.g. 5 minutes)
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.loadbalancer.id
  port              = var.alb_port
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.load_balancer_tg.id
  }
}