output "vpc_id" {
value =  aws_vpc.main.id 
}
output "subnet_id" {
    value = aws_subnet.public_subnet_1.id 
}
output "public_subnet_1" {
    value = aws_subnet.public_subnet_1.id  
}
output "public_subnet_2" {
    value = aws_subnet.public_subnet_2.id  
}
