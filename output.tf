output "zones" {
    value=data.aws_availability_zones.available.names
  
}

output "vpcid" {
    value = aws_vpc.vpc_stage.id
  
}

output "igw" {
    value=aws_internet_gateway.igw_stage.arn
  
}