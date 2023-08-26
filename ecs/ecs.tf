resource "aws_ecs_cluster" "group2-chat-cluster" {
  name = "group2-chat-app-cluster"
}

resource "aws_ecs_task_definition" "group2-chat-td" {
  family = "group2-chat-app-td"
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu = "512"
  memory = "1024"
  execution_role_arn = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"
  container_definitions = file("ecs-td-container-definition.json")
}

resource "aws_security_group" "ecs-sg" {
  vpc_id = var.vpc_id
  name = "group2-ecs-sg"
  
  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 80
    to_port = 80
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

resource "aws_ecs_service" "group2-chat-service" {
  name = "group2-chat-app-service"
  cluster = aws_ecs_cluster.group2-chat-cluster.id
  task_definition = aws_ecs_task_definition.group2-chat-td.arn
  launch_type = "FARGATE"
  depends_on = [ aws_security_group.ecs-sg ]
  desired_count = 1
  
  network_configuration {
    subnets = var.subnets
    security_groups = [aws_security_group.ecs-sg.id]
    assign_public_ip = true
  }
}