variable "vpc_id" {
  type = string
  default = "vpc-038783054495c1d2f"
}

variable "subnets" {
  type = list(string)
  default = ["subnet-0a66f860edb68d17a", "subnet-0cb72c22794da5e18"]  
}
