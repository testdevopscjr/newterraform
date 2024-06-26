resource "aws_security_group" "alb" {
   name        = "allow end user"
   description = "Allow end user"
   vpc_id      = aws_vpc.vpc_stage.id


  ingress {
    description      = "end user from admin4 "
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

  
