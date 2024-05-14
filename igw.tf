resource "aws_internet_gateway" "igw_stage" {
  vpc_id = aws_vpc.vpc_stage.id

  tags = {
    Name = "igw_stage"
  }

  depends_on = [ aws_vpc.vpc_stage ]
} 

