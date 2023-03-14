
create_vpc = true
create_ec2 = true
create_alb = true

# VPC
vpc_cidrs   = "10.0.0.0/16"
#public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
#private_subnet_cidrs= ["10.0.4.0/24", "10.0.5.0/24"]
#public_subnet_cidrs  = ["10.0.4.64/26"]
#private_subnet_cidrs= ["10.0.4.0/26"]
azs = ["us-east-1a", "us-east-1b"]

# EC2

ami_id  = "ami-0aa7d40eeae50c9a9"
subnet_id  = "subnet_id"
instance_type  = "t2.micro"

