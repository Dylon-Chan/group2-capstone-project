# Define an output variable to expose the URL of the Amazon ECR repository.
output "repository_url" {
  # Provide a description of the output variable.
  description = "The URL of the repository."
   # Set the value of this output variable to the repository URL of the AWS ECR repository.
  value = aws_ecr_repository.ecr.repository_url
}