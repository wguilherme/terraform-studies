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

Quando o cluster estiver pronto, copie ou baixe o arquivo `kubeconfig` pela interface do rancher. 

### Preparando o ingress

Com o kubeconfig copiado, copie o IP da máquina kubernetes (`ansible/inventory.ini`) e configure o seu DNS apontando todos os domínios para o IP da máquina kubernetes, ex: `127.0.0.1`.

### Conclusão

Neste ponto, você deve ter a seguinnte infraestrutura:

3 máquina EC2 (rancher, kubernetes e ollama)

**Máquina kubernetes:**
- Rodando o kubernetes criado via rancher
- DNS apontando para o IP da máquina
- Arquivo kubeconfig copiado e acessível pela máquina que vai operar

**Máquina rancher**
- Rodando o rancher no docker
- Gerenciando o cluster de kubernetes criado

**Máquina ollama:**
1 ollama com os modelos prontos e acessíveis
1 ollama web ui rodando

## Troubleshooting

Veja comandos úteis para troubleshooting e debug executando o comando `make help`
