/*
    Arquivo que resulta nas saídas do recurso de rede criado na Azure.
*/

output "id" {
    description = "Id da vNet criada."
    value       = "${azurerm_virtual_network.network.id}"
}

output "name" {
    description = "Nome da vNet criada."
    value       = "${azurerm_virtual_network.network.name}"
}

output "address_space" {
    description = "Endereçamento das vNets criadas."
    value       = "${azurerm_virtual_network.network.address_space}"
}

output "dns_servers" {
    description = "Servidores DNS atachados na vNet."
    value       = "${azurerm_virtual_network.network.dns_servers}"
}

 