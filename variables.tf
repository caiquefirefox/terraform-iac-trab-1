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