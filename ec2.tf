resource "aws_instance" "devops_instance" {
  ami             = "ami-00c257e12d6828491"  # Ubuntu AMI ID
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet.id
  key_name        = "annis"

  tags = {
    Name = "DevOps-Instance"
  }

  user_data = file("${path.module}/scripts/install.sh")
}
