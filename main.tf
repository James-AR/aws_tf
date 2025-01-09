terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
}

module "vpc" {
  source = "./modules/vpc"
}

module "server" {
  source = "./modules/server"
  ssh_public_key = var.ssh_public_key
  main_vpc_id = module.vpc.main_vpc_id
  main_subnet_id = module.vpc.web_subnet_id
  is_test = var.is_test
}

resource "aws_iam_user" "test" {
  for_each = toset(var.users)
  name = each.key
}