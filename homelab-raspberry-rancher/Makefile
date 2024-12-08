.PHONY: all init plan apply destroy ansible clean

# Variáveis
TERRAFORM_DIR = ./terraform
ANSIBLE_DIR = ./ansible
SSH_KEY_PATH = ${HOME}/.ssh/study.pem

# Cores para output
GREEN = \033[0;32m
RED = \033[0;31m
YELLOW = \033[1;33m
NC = \033[0m # No Color

all: verify init plan apply ansible

# Terraform commands
init:
	@echo "${GREEN}Inicializando Terraform...${NC}"
	@cd $(TERRAFORM_DIR) && terraform init

plan:
	@echo "${GREEN}Planejando infraestrutura...${NC}"
	@cd $(TERRAFORM_DIR) && terraform plan

apply:
	@echo "${GREEN}Aplicando infraestrutura...${NC}"
	@cd $(TERRAFORM_DIR) && terraform apply -auto-approve

destroy:
	@echo "${RED}Destruindo infraestrutura...${NC}"
	@cd $(TERRAFORM_DIR) && terraform destroy -auto-approve

# Ansible commands
ansible: check-key
	@echo "${GREEN}Executando Ansible...${NC}"
	@cd $(ANSIBLE_DIR) && ansible-playbook -i inventory.ini playbook.yml $(if $(HOST),-l $(HOST))
# ansible: check-key
# 	@echo "${GREEN}Executando Ansible...${NC}"
# 	@cd $(ANSIBLE_DIR) && ansible-playbook -i inventory.ini playbook.yml

# Verificação da chave SSH
check-key:
	@if [ ! -f $(SSH_KEY_PATH) ]; then \
		echo "${RED}Erro: Chave SSH não encontrada em $(SSH_KEY_PATH)${NC}"; \
		echo "${YELLOW}Por favor, coloque sua chave study.pem em ~/.ssh/${NC}"; \
		exit 1; \
	fi
	@if [ "$$(stat -c %a $(SSH_KEY_PATH))" != "400" ]; then \
		echo "${YELLOW}Ajustando permissões da chave SSH...${NC}"; \
		chmod 400 $(SSH_KEY_PATH); \
	fi

# Cleanup
clean:
	@echo "${RED}Limpando arquivos temporários...${NC}"
	@rm -rf $(TERRAFORM_DIR)/.terraform
	@rm -f $(TERRAFORM_DIR)/.terraform.lock.hcl
	@rm -f $(TERRAFORM_DIR)/terraform.tfstate*
	@rm -f $(ANSIBLE_DIR)/inventory.ini

# Help
help:
	@echo "Comandos disponíveis:"
	@echo "  make all         - Executa todo o processo (init, plan, apply, ansible)"
	@echo "  make init        - Inicializa o Terraform"
	@echo "  make plan        - Mostra o plano do Terraform"
	@echo "  make apply       - Aplica as mudanças do Terraform"
	@echo "  make ansible     - Executa o playbook do Ansible"
	@echo "  make destroy     - Destrói a infraestrutura"
	@echo "  make clean       - Remove arquivos temporários"
	@echo ""
	@echo "Importante: A chave SSH (study.pem) deve estar em ~/.ssh/"

# Verifica se as ferramentas necessárias estão instaladas
verify:
	@echo "Verificando ferramentas necessárias..."
	@which terraform >/dev/null 2>&1 || (echo "${RED}Terraform não encontrado${NC}"; exit 1)
	@which ansible >/dev/null 2>&1 || (echo "${RED}Ansible não encontrado${NC}"; exit 1)
	@echo "${GREEN}Todas as ferramentas estão instaladas!${NC}"