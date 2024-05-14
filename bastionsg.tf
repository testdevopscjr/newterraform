resource "aws_security_group" "bastion" {
   name        = "bastion-sg"
   description = "Allow admin"
   vpc_id      = aws_vpc.vpc_stage.id


  ingress {
    description      = "connecting admin on ssh "
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["49.204.199.98/32"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}


resource "aws_instance" "bastion-ec2" {
  ami           = "ami-05b46bc4327cf9d99"
  instance_type = "t2.micro"
  
  subnet_id=aws_subnet.public_stage[0].id
  vpc_security_group_ids = [aws_security_group.bastion.id]



  tags = {
    Name = "ec2-bastion"
  }
}
  
