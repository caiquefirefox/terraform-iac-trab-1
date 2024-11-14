resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "rds-subnet-group"
  subnet_ids = [
    aws_subnet.private_subnet.id,
    aws_subnet.private_subnet_2.id,
  ]

  tags = {
    Name = "RDSSubnetGroup"
  }
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "16.4"
  instance_class         = "db.t3.micro"
  db_name                = var.rds_db_name
  username               = var.rds_db_user
  password               = var.rds_db_password
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true

  tags = {
    Name = "MyRDSInstance"
  }
}

output "rds_endpoint" {
  value = aws_db_instance.rds_instance.endpoint
}