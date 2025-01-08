variable "ssh_public_key" {
  
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