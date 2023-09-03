terraform {
  #Specify to use AWS S3 bucket to store Terraform state files
  backend "s3" {
    bucket  = "ce2-group2-capstone-project-tfstate-bucket"  #Specify the name of S3 bucket where Terraform will store its state file
    key     = "environments/prod/deploy.tfstate"
    region  = "ap-southeast-1"
  }
}