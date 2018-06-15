/*
    Arquivo que resulta nas saídas do recursos criados na Azure.
*/

#Modulo resourcegroup
output "resource_group_id" {
    description = "Id do resource group criado."
    value       = "${module.resourcegroup.id}"
}

output "resource_group_name" {
    description = "Nome do resource group criado."
    value       = "${module.resourcegroup.name}"
}

#Modulo network
output "vnet_id" {
    description = "Id da vNet criada."
    value       = "${module.network.id}"
}

output "vnet_name" {
    description = "Nome da vNet criada."
    value       = "${module.network.name}"
}

output "vnet_address_space" {
    description = "Endereçamento das vNets criadas."
    value       = "${module.network.address_space}"
}

/*
output "vnet_subnet" {
    description = "Subnet criadas na vNet."
    value       = "${module.network.vnet_subnet}"
}
*/

#Modulo subnet
output "subnet_name" {
    description = "Nome da subnet criada."
    value       = "${module.subnet.name}"
}

output "subnet_id" {
    description = "Nome da subnet criada."
    value       = "${module.subnet.id}"
}

output "subnet_address_prefix" {
    description = "Nome da subnet criada."
    value       = "${module.subnet.address_prefix}"
}

#Modulo networkinterface
output "network_inteface_name" {
    description = "Nome da interface de rede criada."
    value       = "${module.networkinterface.name}"
}

output "network_inteface_id" {
    description = "Nome da interface de rede criada."
    value       = "${module.networkinterface.id}"
}

output "network_inteface_ip_configuration" {
    description = "Nome da interface de rede criada."
    value       = "${module.networkinterface.ip_configuration}"
}
