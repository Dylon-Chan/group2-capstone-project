terraform {
  backend "s3" {
    bucket  = "ws-multi-env"
    key     = "environments/modules/ecr/ecr.tfstate"
    region  = "ap-southeast-1"
  }
}