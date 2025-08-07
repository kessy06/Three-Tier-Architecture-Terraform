resource "aws_instance" "app" {
  count         = 2
  ami           = data.aws_ami.linux.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = aws_subnet.private[count.index].id
  security_groups = [aws_security_group.app_sg.id]

  tags = {
    Name = "App-Server-${count.index + 1}"
  }
}
