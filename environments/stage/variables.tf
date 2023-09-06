#Specifies environment variable
variable "env" {
  description = "Environment"
  type = string
  default = "stage"
}

#Specifies IAM role to assume for AWS resource access
variable "role_to_assume" {
  description = "Role to Assume"
  type = string
  default = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"
}

#Defines the ECS security group variable
variable "ecs_sg_name" {
  description = "ECS Security Group Name"
  type = string
  default = "group2-ecs-sg-stage"
}

#Specifies port on which application or service will listen
variable "image_port" {
    description = "Image Port"
    type = number
    default = 3000
}

#Sets the port number for the Application Load Balancer (ALB). This variable defines the port on which the ALB will listen for incoming traffic.
variable "alb_port" {
    description = "ALB Port"
    type = number
    default = 8000
}

#Set the default VPC ID
variable "vpc_id" {
  type = string
  default = "vpc-038783054495c1d2f"
}

#Defines a list of subnet IDs within the VPC
variable "subnets" {
  type = list(string)
  default = ["subnet-0a66f860edb68d17a", "subnet-0cb72c22794da5e18"]  
}

#Specifies the name of ECR(Elastic Container Registry) repo where container images are stored
variable "image_name" {
  description = "ECR Repository Name"
  type = string
}

#Specifies the version or tag of the container image, with a default value of "latest"
variable "image_tag" {
  description = "Image Tag"
  type = string
  default = "latest"
}

#Define a variable to represent the sha256 digest of the image in the ECR repository
variable "image_digest" {
  description = "ECR Repository Digest"
  type = string
}

#Name of ECS service/task
variable "ecs_name" {
  description = "ECS Name"
  type = string
  default = "group2-chat-app-stage"
}

#Specifies the CPU units allocated to ECS task
variable "cpu" {
  description = "CPU"
  type = number
  default = 512
}

#Specifies the memory (in MiB) allocation for ECS tasks
variable "memory" {
  description = "Memory"
  type = number
  default = 1024
}

#Specifies the name of an ECS (Elastic Container Service) security group for load balancing in a stage environment
variable "lb_sg_name" {
  description = "ECS Security Group Name"
  type = string
  default = "group2-chat-app-lb-sg-stage"
}