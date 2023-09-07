#Creates an AWS security group named ecs_sg within the specified VPC to allow incoming traffic on a specified port (var.image_port) from any source (0.0.0.0/0) and allows all outgoing traffic
resource "aws_security_group" "ecs_sg" {
  vpc_id = var.vpc_id
  name = var.ecs_sg_name
  
  ingress {
    from_port = var.image_port
    to_port = var.image_port
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
            hostPort: var.image_port,
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
  depends_on = [ aws_security_group.ecs_sg, aws_ecs_task_definition.task ]
  desired_count = 1

  network_configuration {
    subnets = var.subnets
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}
