# vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

# public subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.az_a
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

# create IGW (note: SSH to the EC2 won't work without this)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# route table for public subnet (note: SSH to the EC2 won't work without this)
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# route table association to the public subnet (note: SSH to the EC2 won't work without this)
resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id      = aws_subnet.PublicSubnet.id
  route_table_id = aws_route_table.PublicRT.id
}

# security group
resource "aws_security_group" "allow_ssh_http" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

# security group ingress SSH
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

# security group ingress http
resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

# security group egress
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}


