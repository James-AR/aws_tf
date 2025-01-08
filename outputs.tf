output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.my_vm[0].public_ip
}

output "ami_id" {
  description = "ID of AMI"
  value = aws_instance.my_vm[0].ami
}