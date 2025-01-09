variable "ssh_public_key" {
  
}

variable "users" {
  type = list(string)
  default = [ "john", "jane", "james"]
}

variable "is_test" {
  type = bool
}