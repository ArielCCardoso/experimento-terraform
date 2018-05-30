#Makefile Experimento Terraform

ifndef env
$(error Enter a value for project. Example: project=dev)
endif

ifndef project
$(error Enter a value for project. Example: project=myproject)
endif

ifndef provider
$(error Enter a value for provider. Example: provider=azure)
endif

all:
        echo "Informe a ação a realizar: init, validate, plan, apply"

init: az-get-access-token
        echo "Init... Provider: ${provider} ambiente: ${env}"
		terraform init -input=false ${provider}/${env}

validate:
        echo "Validade... Provider: ${provider} ambiente: ${env}"
		terraform validate -var "env=${env} project=${project}" -var-file="${provider}/${env}/${env}-terraform.tfvars" ${provider}/${env}

plan:
        echo "Plan... Provider: ${provider} ambiente: ${env}"
		terraform plan -input=false -out="${provider}/${env}/${env}-terraform.tfplan" -state="${provider}/${env}/${env}-terraform.tfstate" -var "env=${env} project=${project}" -var-file="${provider}/${env}/${env}-terraform.tfvars" ${provider}/${env}

apply:
        echo "Apply... Provider: ${provider} ambiente: ${env}"
		terraform apply -input=false -state="${provider}/${env}/${env}-terraform.tfstate" -var "env=${env} project=${project}" -var-file="${provider}/${env}/${env}-terraform.tfvars" "${provider}/${env}/${env}-terraform.tfplan"

az-get-access-token:
		az account get-access-token

