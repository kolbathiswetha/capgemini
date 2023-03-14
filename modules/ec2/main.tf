resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    subnet_id = var.subnet_id
    instance_type = var.instance_type

    tags = {
    Name = "Project VPC EC2"
    }
}