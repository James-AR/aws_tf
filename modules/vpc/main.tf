# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = local.common-tags
}

# Create a subnet
resource "aws_subnet" "web" {
  vpc_id = aws_vpc.main_vpc.id
  cidr_block = var.web_subnet
  availability_zone = var.azs[0]
  tags = local.common-tags
}

resource "aws_internet_gateway" "my_web_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    "Name" = "Main VPC IGW"
    "Version" = "${local.common-tags["Version"]}"
  }
}

resource "aws_default_route_table" "main_vpc_default_rt" {
  default_route_table_id = aws_vpc.main_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_web_igw.id
  }
  tags = {
    "Name" = "Default RT"
  }
}