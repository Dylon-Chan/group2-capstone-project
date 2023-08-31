terraform {
  backend "s3" {
    bucket  = "ws-multi-env"
    key     = "environments/stage/ws-app.tfstate"
    region  = "ap-southeast-1"
  }
}