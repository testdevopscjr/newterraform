resource "aws_security_group" "apache" {
   name        = "allow apache"
   description = "Allow apache user"
   vpc_id      = aws_vpc.vpc_stage.id


   ingress {
    description      = "connecting admin on ssh "
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    
    security_groups = [aws_security_group.bastion.id]
    
  }

   ingress {
    description      = "for alb end user "
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
  security_groups = [aws_security_group.alb.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "apache-sg"
  }
}

  
resource "aws_instance" "apache-ec2" {
  ami           = "ami-05b46bc4327cf9d99"
  instance_type = "t2.micro"
  
  subnet_id=aws_subnet.private_stage[1].id
  vpc_security_group_ids = [aws_security_group.apache.id]



  tags = {
    Name = "ec2-apache"
  }
}