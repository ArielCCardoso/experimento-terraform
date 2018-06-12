/*
    Arquivo que resulta nas saídas dos grupos de segurança criados na Azure.
*/

output "network_inteface_id" {
    description = "Id do security group criado."
    value       = "${azurerm_network_security_group.securitygroup.*.id}"
}

output "security_group_name" {
    description = "Nome do security group criado."
    value       = "${azurerm_network_security_group.securitygroup.*.name}"
}
