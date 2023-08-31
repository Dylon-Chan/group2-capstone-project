terraform {
  backend "s3" {
    bucket  = "ce2-group2-capstone-project-tfstate-bucket"
    key     = "environments/stage/deploy.tfstate"
    region  = "ap-southeast-1"
  }
}