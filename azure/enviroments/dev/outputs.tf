/*
    Arquivo que resulta nas saídas do recursos criados na Azure.
*/

#Modulo resourcegroup
output "resource_group_id" {
    description = "Id do resource group criado."
    value       = "${module.resourcegroup.resource_group_id}"
}

output "resource_group_name" {
    description = "Nome do resource group criado."
    value       = "${module.resourcegroup.resource_group_name}"
}

#Modulo network
output "vnet_id" {
    description = "Id da vNet criada."
    value       = "${module.network.vnet_id}"
}

output "vnet_name" {
    description = "Nome da vNet criada."
    value       = "${module.network.vnet_name}"
}

output "vnet_address_space" {
    description = "Endereçamento das vNets criadas."
    value       = "${module.network.vnet_address_space}"
}

/*
output "vnet_subnet" {
    description = "Subnet criadas na vNet."
    value       = "${module.network.vnet_subnet}"
}
*/

#Modulo subnet
output "subnets" {
    description = "Nome da subnet criada."
    value       = "${module.subnet.subnets}"
}

output "subnet_name" {
    description = "Nome da subnet criada."
    value       = "${module.subnet.subnet_name}"
}

output "subnet_id" {
    description = "Nome da subnet criada."
    value       = "${module.subnet.subnet_id}"
}

output "subnet_address_prefix" {
    description = "Nome da subnet criada."
    value       = "${module.subnet.subnet_address_prefix}"
}
