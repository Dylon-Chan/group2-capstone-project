# Define a Terraform variable for the ECR repository name.
variable "image_name" {
  # Provide a description of the variable.
  description = "ECR Repository Name"
  # Specify the data type of the variable.
  type = string
  # Set a default value for the variable (can be overridden when using this module).
  default = "group2-chat-app"
}

# Define a variable to represent the image tag for the ECR repository
variable "image_tag" {
  # Provide a description of the variable.
  description = "ECR Repository Tag"
  # Specify the data type for the variable.
  type = string
  # Set a default value for the variable (can be overridden when using this module).
  default = "latest"
}