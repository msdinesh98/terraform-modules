#VPC and IGW
resource "aws_vpc" "myvpc01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-one"
  }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc01.id
  tags = {
    Name = "myig-one"
  }
}
#Public and Private subnets
resource "aws_subnet" "pub_subnet" {
  tags = {
    Name = "mysub-one"
  }
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.myvpc01.id
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "private_subnet" {
    tags = {
        Name = "mysub-two"
    }
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.myvpc01.id
  availability_zone = "us-east-2b"
}
#Route table for Public subnet and its assosiation
resource "aws_route_table" "my-rt-one" {
  vpc_id = aws_vpc.myvpc01.id
  route = {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "route-public"
  }
}
resource "aws_route_table_association" "my-rt-plus" {
  route_table_id = aws_route_table.my-rt-one.id
  subnet_id = aws_subnet.pub_subnet.id
}
#Security group rules
resource "aws_security_group" "testSG" {
  name        = testServerSG
  description = "sg for test servers"
  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}