resource "aws_instance" "ec2_application" {
  ami                    = lookup(var.aws_amis, var.aws_region)
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo yum install -y mariadb-server
              sudo amazon-linux-extras enable php8.0
              sudo yum install -y php php-mysqlnd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo systemctl start mariadb
              sudo systemctl enable mariadb
              sudo systemctl restart httpd
              echo '<?php echo "Hello World from PHP!"; ?>' | sudo tee /var/www/html/hello.php
              sudo chmod 644 /var/www/html/hello.php
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