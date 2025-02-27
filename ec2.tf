resource "aws_security_group" "devops_sg" {
  name        = "devops-security-group"
  description = "Allow SSH and HTTP access"

  vpc_id = aws_vpc.main.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict this to your IP for security
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "devops_instance" {
  ami             = "ami-00c257e12d6828491"  # Update to the correct AMI
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_subnet.id
  key_name        = "annis"
  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  associate_public_ip_address = true  # Ensures a public IP is assigned

  tags = {
    Name = "DevOps-Instance"
  }

  user_data = file("${path.module}/scripts/install.sh")
}
