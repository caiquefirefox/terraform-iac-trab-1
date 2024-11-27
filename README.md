# Terraform Project 🚀

## Descrição 📄
Este projeto utiliza **Terraform** para provisionar e gerenciar a infraestrutura na nuvem de forma eficiente e reproduzível. Ele foi desenvolvido com foco em boas práticas, modularização e facilidade de uso.

## Requisitos 📋

Certifique-se de atender aos seguintes requisitos antes de iniciar:

1. Instale o **Terraform CLI**:  
   [Guia de instalação do Terraform](https://www.terraform.io/downloads)

2. Configure credenciais do provedor de nuvem:  
   Para AWS, configure seu arquivo de variavel de ambiente (tfvars) com as variáveis abaixo:  
   ```bash
   aws_access_key - Sua chave de acesso AWS
   aws_secret_key - Sua secret de acesso AWS
   token - Seu token de acesso AWS
   bucket_name - Nome do seu bucket
   rds_db_name - Nome do banco de dados no RDS
   rds_db_user - Nome do usuário do banco de dados no RDS
   rds_db_password - Senha do usuário do banco de dados no RDS         
   ```

## Instalação

1. Clone o repositório:

    ```bash
    git clone https://github.com/caiquefirefox/terraform-iac-trab-1.git
    cd terraform-iac-trab-1
    ```

2. Inicialize o diretório do Terraform:

    ```bash
    terraform init
    ```

3. Configure suas credenciais de nuvem (dependendo da plataforma que você está usando).

## Uso

1. Valide a configuração do Terraform:

    ```bash
    terraform validate
    ```

2. Planeje a infraestrutura:

    ```bash
    terraform plan
    ```

3. Aplique a infraestrutura:

    ```bash
    terraform apply
    ```

4. Para destruir a infraestrutura:

    ```bash
    terraform destroy
    ```
