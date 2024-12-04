# Terraform

## Comandos principais

- `terraform init`
- `terraform validate`
- `terraform plan`
- `terraform apply`
- `terraform destroy`

### Utilitários

- `terraform apply -auto-approve` // aplica as configurações precisar de confirmação

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

```bash
# Comando para visualizar as configurações
terraform graph
```

```bash
# Comando para visualizar as configurações
terraform state
```

```bash
# Comando para visualizar as configurações
terraform console
```
