variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
  description = "CIDR block for the VPC"
  type = string
}

variable "web_subnet" {
  default = "10.0.10.0/24"
  description = "Web subnet"
  type = string
}
