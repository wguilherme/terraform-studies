# Terraform

## Comandos principais

- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply`
- `terraform destroy`

### Utilitários

- `terraform apply -auto-approve` // aplica as configurações precisar de confirmação
- `terraform init -upgrade` // atualiza o terraform e suas dependências

#### Arquivos .tfvars

O terraform lê automaticamente apenas o arquivo terraform.tfvars ou arquivos com extensão *.auto.tfvars.
Para outros arquivos .tfvars, você precisa especificá-los explicitamente usando o flag -var-file:

```bash
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

#### Precedência de Definição de Variável

1 - Variáveis de ambiente
2 - Arquivo `terraform.tfvars`
3 - Arquivo `terraform.tfvars.json`
4 - Arquivo `*.auto.tfvars` ou `*.auto.tfvars.json`
5 - Qualquer opção `-var` ou `-var-file` passada na linha de comando, na ordem fornecida

## Utilizando variáveis de ambiente

```bash
AWS_ACCESS_KEY_ID=<value> AWS_SECRET_ACCESS_KEY=<value> terraform apply
```

## Gerando um plan com output e aplicando baseado no arquivo

```bash
terraform plan -out=tfplan
terraform apply tfplan
```

### Para verificar o conteúdo do arquivo gerado (tfplan):
```bash
terraform show tfplan
```

### Comandos


Inicia o Terraform, caso seja o primeiro uso
gera os arquivos de configuração: 
```bash
# Comando para iniciar o Terraform
terraform init
```


Aplica as configurações:
```bash
# Comando para aplicar as configurações
terraform apply
```


Destroi as configurações:
```bash
# Comando para destruir as configurações
terraform destroy
```

### Comandos úteis

```bash
# Comando para validar os arquivos de configuração
terraform validate
```

```bash
# Comando para formatar os arquivos de configuração
terraform fmt
```

```bash
# Comando para visualizar os arquivos de configuração
terraform show
```

```bash
# Comando para visualizar as configurações
terraform plan
#  Comando para visualizar as configurações em um arquivo `.tfplan`
terraform plan -out=tfplan

```


## Troubleshooting

### Comandos úteis

```bash
# Terraform console
terraform console
# após rodar o comando, navegar pelas configs <resource.path>,
#  ex.: aws_s3_bucket.this
#  ex.: aws_s3_bucket.this.tags
# 


# Visualizar os arquivos de configuração
terraform show

# Visualizar as configurações
terraform state

# Visualizar as configurações
terraform graph


#  Formatar o código
terraform fmt
```