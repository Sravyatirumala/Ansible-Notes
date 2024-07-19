resource "aws_vpc" "Ansible-vpc" {
  cidr_block = "172.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "useast-2-vpc"
  }

}


resource "aws_subnet" "Ansible_subnet" {
  vpc_id                  = aws_vpc.Ansible-vpc.id
  cidr_block              = "172.0.1.0/24"
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "useast-2-subnet"
  }
}


resource "aws_subnet" "Ansible_subnet2" {
  vpc_id                  = aws_vpc.Ansible-vpc.id
  cidr_block              = "172.0.2.0/24"
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "useast-2-subnet"
  }
}

