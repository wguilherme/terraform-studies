## Terraform

Configure seu CLI do terraform,
altere o profile, região e configurações no arquivo `.main.tf`

Execute o comando `make apply` para rodar o terraform e criar a infraestrutura

## Ansible

Execute o comandno `make ansible` para executar o playbook do ansible e configurar as máquinas necessárias

## Deployment

### Acessando o rancher

Primeiro acesse o rancnher que foi criado pelo IP que está disponível no arquivo `ansible/inventory.ini`, este arquivo é gerado automaticamente pela automação.

Após acessar, consulte a senha que foi mostrada no terminal ao final da automação para logar no rancher e criar seus clusters.


### Criando um cluster

Após definir sua nova senha para o rancher, crie um novo cluster _custom_ pela UI do rancher e configure em advanced o nginx-ingress como default backend.

Crie um novo nó que seja etcd, control-plane e worker.

### Subindo o Kubernetes

Após copiar o código gerado pelo rancher, acesse, via ssh, a máquina do kubernetes, o IP pode ser consultado no arquivo `ansible/inventory.ini`. Execute o comando e acompanhe o progresso pela UI do rancher.

## Troubleshooting

Veja comandos úteis para troubleshooting e debug executando o comando `make help`
