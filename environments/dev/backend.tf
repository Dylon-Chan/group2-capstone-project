terraform {
  backend "s3" {
    bucket  = "ws-multi-env"
    key     = "environments/dev/ws-app.tfstate"
    region  = "ap-southeast-1"
  }
}