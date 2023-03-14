variable "vpc_cidrs" {
 type        = string
 description = "VPC CIDR values"
 #default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 #default     = ["us-east-1a", "us-east-1b"]
}
variable "ami_id" {
 type        = string
 description = "ami_id"
 #default     = "ami-0aa7d40eeae50c9a9"
}

variable "subnet_id" {
 type        = string
 description = "subnet_id"
}

variable "instance_type" {
 type        = string
 description = "instance_type"
 #default     = "t2.micro"
}

variable "create_vpc" {
 default     = false
}
variable "create_ec2" {
 default     = false
}
variable "create_alb" {
 default     = false
}