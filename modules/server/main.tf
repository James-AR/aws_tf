resource "aws_default_security_group" "default_sec_group" {
  vpc_id = var.main_vpc_id

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks= ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "Default Security Group"
  }
}

data "aws_ami" "latest_amazon_linux2" {
  owners = ["amazon"]
  most_recent = true
  filter {
    name = "name"
    values = ["al2023-ami-*-kernel-6.1-x86_64"]
  }

  filter {
    name = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_key_pair" "testing_ssh_key" {
  key_name = "testing_ssh_key"
  public_key = file(var.ssh_public_key)
}

resource "aws_instance" "my_vm" {
  ami = data.aws_ami.latest_amazon_linux2.id
  instance_type = "t2.micro"
  count = var.is_test == true ? 1:0
  subnet_id = var.main_subnet_id
  vpc_security_group_ids = [aws_default_security_group.default_sec_group.id]
  associate_public_ip_address = true
  key_name = aws_key_pair.testing_ssh_key.key_name
  user_data = file("entry-script.sh")
  tags = {
    "Name" = "EC2 Instance - Amazon Linux 2"
  }
}