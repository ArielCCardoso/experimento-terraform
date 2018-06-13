#Makefile Experimento Terraform

.DEFAULT_GOAL := all

checkargs:
	if [ "${env}" = "" ] || [ -z ${env} ]; then echo "Enter a value for env. Example: env=dev"; exit 1; fi
	if [ "${project}" = "" ] || [ -z ${project} ]; then echo "Enter a value for project. Example: project=myproject"; exit 1; fi
	if [ "${provider}" = "" ] || [ -z ${provider} ]; then echo "Enter a value for provider. Example: provider=azure"; exit 1; fi

checkargsgraph:
	if [ "${type}" = "" ] || [ -z ${type} ]; then echo "Enter a value for type. Example: type=plan / type=apply / type=refresh / type=input"; exit 1; fi

all:
	echo "Informe a ação a realizar: init, validate, plan, apply, destroy, refresh, graph"
	exit 1

init: azgetaccesstoken checkargs
	echo "Init... Provider: ${provider} ambiente: ${env}"
	terraform init -input=false ${provider}/enviroments/${env}

validate: checkargs
	echo "Validade... Provider: ${provider} ambiente: ${env}"
	terraform validate -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" ${provider}/enviroments/${env}

plan: checkargs
	echo "Plan... Provider: ${provider} ambiente: ${env}"
	terraform plan -parallelism=1 -input=false -out="${provider}/enviroments/${env}/terraform.tfplan" -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" ${provider}/enviroments/${env}

destroy: checkargs
	echo "Destroy... Provider: ${provider} ambiente: ${env}"
	terraform destroy -parallelism=1 -input=false -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" -auto-approve
	$(MAKE) refresh
		
apply: checkargs
	echo "Apply... Provider: ${provider} ambiente: ${env}"
	terraform apply -auto-approve -parallelism=1 -input=false -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars" "${provider}/enviroments/${env}/"
	$(MAKE) refresh

azgetaccesstoken:
	az account get-access-token

graph: checkargs checkargsgraph
	terraform graph -type="${type}" "${provider}/enviroments/${env}/" | dot -Tjpeg > "${provider}/enviroments/${env}/graph-${type}.jpeg"
	
refresh: 	
	echo "Refresh... Provider: ${provider} ambiente: ${env}"
	terraform refresh -input=false -state="${provider}/enviroments/${env}/terraform.tfstate" -var "env=${env}" -var "project=${project}" -var-file="${provider}/enviroments/${env}/terraform.tfvars"

