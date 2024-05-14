resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_stage.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_stage.id
  }



  tags = {
    Name = "public-route"
  }
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc_stage.id
  

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
  }



  tags = {
    Name = "private-route"
  }
}


#association
resource "aws_route_table_association" "public" {
    count=length(aws_subnet.public_stage[*].id)
  subnet_id      = element(aws_subnet.public_stage[*].id,count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
    count=length(aws_subnet.private_stage[*].id)
  subnet_id      = element(aws_subnet.private_stage[*].id,count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "data" {
    count=length(aws_subnet.private_stage[*].id)
  subnet_id      = element(aws_subnet.data_stage[*].id,count.index)
  route_table_id = aws_route_table.private.id
}