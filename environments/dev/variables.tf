#Specifies environment variable
variable "env" {
  description = "Environment"
  type = string
  default = "dev"
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
  default = "group2-ecs-sg-dev"
}

#Specifies port on which application or service will listen
variable "image_port" {
    description = "Image Port"
    type = number
    default = 3000
}

#Set the default VPC ID
variable "vpc_id" {
  type = string
  default = "vpc-01eb8331fac862b2e"
}

#Defines a list of subnet IDs within the VPC
variable "subnets" {
  type = list(string)
  default = ["subnet-0623d78431b777e3e" ]  
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
  default = "group2-chat-app-dev"
}

#Specifies the CPU units allocated to ECS task
variable "cpu" {
  description = "CPU"
  type = number
  default = 256
}

#Specifies the memory (in MiB) allocation for ECS tasks
variable "memory" {
  description = "Memory"
  type = number
  default = 512
}