# Define an output variable to expose the URL of the Amazon ECR repository.
output "repository_url" {
  # Provide a description of the output variable.
  description = "The URL of the repository."
   # Set the value of this output variable to the repository URL of the AWS ECR repository.
  value = aws_ecr_repository.ecr.repository_url
}

# Fetch details of an image from the ECR repository previously created
data "aws_ecr_image" "service_image" {
  # Reference the name of the ECR repository previously created
  repository_name = aws_ecr_repository.ecr.name
  # Use the image tag provided as a variable to fetch the image details
  image_tag = var.image_tag
}

# Output the sha256 digest of the retrieved image from the ECR repository
output "image_digest" {
  # Provide a description of the output variable.
  description = "The sha256 digest of the image."
  # Reference the image digest of the fetched image from the data source
  value = data.aws_ecr_image.service_image.image_digest
}