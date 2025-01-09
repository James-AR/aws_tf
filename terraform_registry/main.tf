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
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = [var.subnet_zone]
  public_subnets  = [var.web_subnet]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "ssh_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/ssh"

  name        = "ssh"
  description = "Security group for SSH ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}