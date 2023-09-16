# VPC

resource "aws_vpc" "project_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = var.vpc_name_tag
  }
}
# 3 Public Subnets
resource "aws_subnet" "public_subnet" {
  count = length(var.public_cidr_block)
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.public_cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]
   tags = {
    Name = "public_subnet_${count.index + 1}"
  }
}
# 3 Private Subnets
resource "aws_subnet" "private_subnet" {
  count = length(var.public_cidr_block)
  vpc_id     = aws_vpc.project_vpc.id
  cidr_block = var.private_cidr_block[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "private_subnet_${count.index + 1}"
  }
}
# Internet Gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.project_vpc.id
  tags = {
    Name = var.igw_name
  }
}
# Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.route_table_name
  }
}
# Route Table association
resource "aws_route_table_association" "public_subnet_association" {
  count = 3
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}