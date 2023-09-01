resource "aws_ecr_repository" "ecr" {
  name = var.image_name
}

resource "aws_ecr_lifecycle_policy" "ecr_lifecycle" {

  repository = aws_ecr_repository.ecr.name
  policy     = file("ecr-lifecycle.json")
}