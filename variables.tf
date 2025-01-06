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

variable "ssh_public_key" {
  
}

variable "azs" {
  description = "AZs in the region"
  type = list(string)
  default = [
    "us-west-1a",
    "us-west-1b",
    "us-west-1c"
  ]
}

variable "users" {
  type = list(string)
  default = [ "john", "jane", "james"]
}

variable "ingress_ports" {
  description = "List of ingress ports"
  type = list(number)
  default = [ 22, 80, 8080 ]
}

variable "is_test" {
  type = bool
}