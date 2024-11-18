resource "aws_instance" "ec2_application" {
  ami                    = lookup(var.aws_amis, var.aws_region)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              # Atualizar os pacotes do sistema
              apt-get update -y

              # Instalar o Apache2
              apt-get install -y apache2

              # Instalar MySQL
              apt-get install -y mysql-server

              # Instalar PHP e as extensões necessárias para o Apache e MySQL
              apt-get install -y php libapache2-mod-php php-mysql

              # Iniciar o Apache2 e MySQL
              systemctl start apache2
              systemctl enable apache2
              systemctl start mysql
              systemctl enable mysql

              # Recarregar o Apache2 para aplicar as configurações
              systemctl restart apache2
            EOF

  tags = {
    Name = "WebServer"
  }
}

resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
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

output "ec2_public_ip" {
  value = aws_instance.ec2_application.public_ip
}