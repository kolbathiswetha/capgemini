resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidrs

 tags = {
   Name = "Project VPC"
 }

}

# resource "aws_subnet" "public_subnets" {
#  count             = length(var.public_subnet_cidrs)
#  vpc_id            = aws_vpc.main.id
#  cidr_block        = element(var.public_subnet_cidrs, count.index)
#  availability_zone = element(var.azs, count.index)
 
#  tags = {
#    Name = "Public Subnet ${count.index + 1}"
#  }
# }

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public Subnet 2"
  }
}

# resource "aws_security_group" "vpc_sg" {
#   name        = "vpc_sg"
#   description = "Allow HTTP traffic"

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
 
# resource "aws_subnet" "private_subnets" {
#  count             = length(var.private_subnet_cidrs)
#  vpc_id            = aws_vpc.main.id
#  cidr_block        = element(var.private_subnet_cidrs, count.index)
#  availability_zone = element(var.azs, count.index)
 
#  tags = {
#    Name = "Private Subnet ${count.index + 1}"
#  }
# }