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

#init : az-get-access-token
init: azgetaccesstoken
	echo "Init... Provider: ${provider} ambiente: ${env}"
	terraform init -input=false ${provider}/enviroments/${env}

validate:
	echo "Validade... Provider: ${provider} ambiente: ${env}"
	terraform validate -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" ${provider}/enviroments/${env}

plan:
	echo "Plan... Provider: ${provider} ambiente: ${env}"
	terraform plan -parallelism=1 -input=false -out="${provider}/enviroments/${env}/terraform.tfplan" -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" ${provider}/enviroments/${env}

destroy:
	echo "Destroy... Provider: ${provider} ambiente: ${env}"
	terraform destroy -parallelism=1 -input=false -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" -auto-approve
	$(MAKE) refresh
		
apply:
	echo "Apply... Provider: ${provider} ambiente: ${env}"
	terraform apply -auto-approve -parallelism=1 -input=false -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" "${provider}/enviroments/${env}/"
	$(MAKE) refresh

azgetaccesstoken:
	az account get-access-token

refresh:
	echo "Refresh... Provider: ${provider} ambiente: ${env}"
	terraform refresh -input=false -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars"
		
		
