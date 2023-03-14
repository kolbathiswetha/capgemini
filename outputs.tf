output "vpc_id" {
    value = module.my_vpc.vpc_id
}
output "subnet_id" {
    value = module.my_vpc.subnet_id  
}
output "instance_id" {
    value = module.my_ec2.instance_id 
}
output "public_subnet_1" {
    value = module.my_vpc.public_subnet_1 
}
output "public_subnet_2" {
    value = module.my_vpc.public_subnet_2 
}
