# Configure the Terraform backend to use Amazon S3 to store the state file.
terraform {
  backend "s3" {
    bucket  = "ce2-group2-capstone-project-tfstate-bucket"
    key     = "environments/modules/ecr/ecr.tfstate"
    region  = "ap-southeast-1"
  }
}