# Define a Terraform variable for the ECR repository name.
variable "image_name" {
  # Provide a description of the variable.
  description = "ECR Repository Name"
  # Specify the data type of the variable.
  type = string
  # Set a default value for the variable (can be overridden when using this module).
  default = "group2-chat-app"
}