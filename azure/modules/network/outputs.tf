/*
    Arquivo que resulta nas saídas do recurso de rede criado na Azure.
*/

output "vnet_id" {
    description = "Id da vNet criada."
    value       = "${azurerm_virtual_network.network.id}"
}

output "vnet_name" {
    description = "Nome da vNet criada."
    value       = "${azurerm_virtual_network.network.name}"
}

output "vnet_address_space" {
    description = "Endereçamento das vNets criadas."
    value       = "${azurerm_virtual_network.network.address_space}"
}
/*
output "vnet_subnet" {
    description = "Subnet criadas na vNet."
    value       = "${azurerm_virtual_network.network.subnet}"
}

output "vnet_dns_servers" {
    description = "Servidores DNS atachados na vNet."
    value       = "${azurerm_virtual_network.vnet.dns_servers}"
}
*/
 