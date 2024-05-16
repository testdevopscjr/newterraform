# #cicdec2
# #rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# resource "aws_instance" "cicd" {
#   ami           = "ami-05b46bc4327cf9d99"
#   instance_type = "t2.micro"
#   #vpc_id=aws_vpc.vpc.id
#   subnet_id = "subnet-02473db433e0fab28"
#   vpc_security_group_ids = [aws_security_group.cicd.id]
#    key_name = aws_key_pair.newkey.id

#   tags = {
#     Name = "cicd"
#   }
# }