variable "aws_region" {
  description = "Regiao do AWS Educate padrao."
  default     = "us-east-1"
}

variable "aws_amis" {
  default = {
    us-east-1 = "ami-0c2b8ca1dad447f8a"
  }
}

variable "aws_access_key" {
  description = "Chave de acesso da AWS"
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "Chave secreta da AWS"
  type        = string
  sensitive   = true
}

variable "token" {
  description = "Token de sessão da AWS, se aplicável"
  type        = string
  sensitive   = true
}

variable "bucket_name" {
  description = "Nome do bucket S3"
}

variable "rds_db_name" {
  description = "Nome da Base de Dados do RDS"
  type        = string
  sensitive   = true
}

variable "rds_db_user" {
  description = "Usuário da Base de Dados do RDS"
  type        = string
  sensitive   = true
}

variable "rds_db_password" {
  description = "Senha da Base de Dados do RDS"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  default = "t2.micro"
}

variable "availability_zones" {
  description = "List of Availability Zones to be used for subnets"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

