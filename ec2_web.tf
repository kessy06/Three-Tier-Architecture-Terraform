data "aws_ami" "linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "web" {
  count         = 2
  ami           = data.aws_ami.linux.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = aws_subnet.public[count.index].id
  security_groups = [aws_security_group.web_sg.id]
  user_data     = file("user_data.sh")

  tags = {
    Name = "Web-Server-${count.index + 1}"
  }
}
