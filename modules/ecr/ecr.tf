# Create an Amazon ECR (Elastic Container Registry) repository with the name specified in the 'var.image_name' variable.
resource "aws_ecr_repository" "ecr" {
  name = var.image_name
}

# Define a lifecycle policy for the ECR repository.
resource "aws_ecr_lifecycle_policy" "ecr_lifecycle" {
  # Specify the repository for which this lifecycle policy applies.
  repository = aws_ecr_repository.ecr.name
  # Load the policy configuration from an external JSON file named 'ecr-lifecycle.json'.
  policy     = file("ecr-lifecycle.json")
}