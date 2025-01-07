# Backend for remote state
# This stores the tfstate in a s3 bucket on AWS

# terraform {
#   backend "s3" {
#     bucket = "master-terraform"
#     key = "s3_backend.tfstate"
#     region = "us-west-1"
#   }
# }