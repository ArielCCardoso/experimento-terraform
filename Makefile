#Makefile Experimento Terraform

ifndef env
$(error A variavel env não foi informada)
endif

ifndef provider
$(error A variavel provider não foi informada)
endif

all:
        echo "Informe a ação a realizar: init, validate, plan, apply"

init: az-get-access-token
        echo "Init... Provider: ${provider} ambiente: ${env}"
		terraform init -input=false ${provider}/${env}

validate:
        echo "Validade... Provider: ${provider} ambiente: ${env}"
		terraform validate ${provider}/${env}

plan:
        echo "Plan... Provider: ${provider} ambiente: ${env}"
		terraform plan -input=false -out="${provider}/${env}/${env}-terraform.tfplan" -state="${provider}/${env}/${env}-terraform.tfstate" ${provider}/${env}

apply:
        echo "Apply... Provider: ${provider} ambiente: ${env}"
		terraform apply -input=false -state="${provider}/${env}/${env}-terraform.tfstate" "${provider}/${env}/${env}-terraform.tfplan"

az-get-access-token:
		az account get-access-token

