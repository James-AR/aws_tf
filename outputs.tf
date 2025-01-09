output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value = module.server.instance[0].public_ip
}

output "ami_id" {
  description = "ID of AMI"
  value = module.server.instance[0].ami
}