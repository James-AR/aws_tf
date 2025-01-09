variable "ssh_public_key" {
  
}

variable "ingress_ports" {
  description = "List of ingress ports"
  type = list(number)
  default = [ 22, 80, 8080 ]
}

variable "main_vpc_id" {
  
}

variable "main_subnet_id" {
  
}

variable "is_test" {
  
}