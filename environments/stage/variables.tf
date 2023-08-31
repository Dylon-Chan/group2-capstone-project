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
  default = "ws-app-ecs-sg-stage"
}

variable "port" {
    description = "Port"
    type = number
    default = 8000
}

variable "vpc_id" {
  type = string
  default = "vpc-038783054495c1d2f" # change!
}

variable "subnets" {
  type = list(string)
  default = ["subnet-0a66f860edb68d17a", "subnet-0cb72c22794da5e18"]  
}

variable "image_name" {
  description = "ECR Repository Name"
  type = string
}

variable "ecs_name" {
  description = "ECS Name"
  type = string
  default = "ws-app-dev"
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

variable "some_condition_that_determines_readiness" {
  description = "A description explaining the purpose of this variable"
  type        = bool
  default     = false
}