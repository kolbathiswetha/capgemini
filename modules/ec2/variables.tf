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
variable "create_ec2" {
 default     = false
}