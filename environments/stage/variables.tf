variable "env" {
  description = "Environment"
  type = string
  default = "stage"
}

variable "role_to_assume" {
  description = "Role to Assume"
  type = string
  default = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"
}

variable "ecs_sg_name" {
  description = "ECS Security Group Name"
  type = string
  default = "group2-ecs-sg-stage"
}

variable "image_port" {
    description = "Port"
    type = number
    default = 3000
}

variable "alb_port" {
    description = "ALB Port"
    type = number
    default = 8000
}

variable "vpc_id" {
  type = string
  default = "vpc-038783054495c1d2f"
}

variable "subnets" {
  type = list(string)
  default = ["subnet-0a66f860edb68d17a", "subnet-0cb72c22794da5e18"]  
}

variable "image_name" {
  description = "ECR Repository Name"
  type = string
  // image_name to be input at runtime
  // default = "255945442255.dkr.ecr.ap-southeast-1.amazonaws.com/group2-chat-app" #for test locally
}

variable "image_tag" {
  description = "Image Tag"
  type = string
  default = "latest"
}

variable "ecs_name" {
  description = "ECS Name"
  type = string
  default = "group2-chat-app-stage"
}

variable "cpu" {
  description = "CPU"
  type = number
  default = 512
}

variable "memory" {
  description = "Memory"
  type = number
  default = 1024
}

variable "lb_sg_name" {
  description = "ECS Security Group Name"
  type = string
  default = "group2-chat-app-lb-sg-stage"
}