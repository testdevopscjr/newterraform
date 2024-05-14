data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_subnet" "public_stage" {
    count = length(data.aws_availability_zones.available.names)
    
  vpc_id     = aws_vpc.vpc_stage.id
  cidr_block = element(var.public-cidr,count.index)
  map_public_ip_on_launch ="true"
  availability_zone = element(data.aws_availability_zones.available.names,count.index)

  tags = {
    Name = "public ${count.index+1}_stage"
  }
}



resource "aws_subnet" "private_stage" {
    count = length(data.aws_availability_zones.available.names)
    
  vpc_id     = aws_vpc.vpc_stage.id
  cidr_block = element(var.private-cidr,count.index)
  
  availability_zone = element(data.aws_availability_zones.available.names,count.index)

  tags = {
    Name = "private ${count.index+1}_stage"
  }
}


resource "aws_subnet" "data_stage" {
    count = length(data.aws_availability_zones.available.names)
    
  vpc_id     = aws_vpc.vpc_stage.id
  cidr_block = element(var.data-cidr,count.index)
  
  availability_zone = element(data.aws_availability_zones.available.names,count.index)

  tags = {
    Name = "data ${count.index+1}_stage"
  }
}
