terraform {
  backend "s3" {
    bucket  = "sctp-ce2-tfstate-bkt"
    key     = "group2-chat-app-ecs.tfstate"
    region  = "ap-southeast-1"
  }
}