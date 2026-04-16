resource "aws_instance" "web" {
  ami           = "ami-0e2c8ccd4e02226ad" 
  instance_type = "t2.micro"             
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = "001D-duocapp-ec2"
  }
}
