variable "aws_region" {
  description = "Regiao do AWS Educate padrao."
  default     = "us-east-1"
}

variable "aws_amis" {
  default = {
    us-east-1 = "ami-0c2b8ca1dad447f8a"
  }
}