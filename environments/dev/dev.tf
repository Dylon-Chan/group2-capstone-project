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
            hostPort: var.image_port,
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
  depends_on = [ aws_security_group.ecs_sg ]
  desired_count = 1
  
  network_configuration {
    subnets = var.subnets
    security_groups = [aws_security_group.ecs_sg.id]
    assign_public_ip = true
  }
}
