/*
    Arquivo que resulta nas saídas dos grupos de segurança criados na Azure.
*/

output "id" {
    description = "Id do security group criado."
    value       = "${azurerm_network_security_group.securitygroup.id}"
}

output "name" {
    description = "Nome do security group criado."
    value       = "${azurerm_network_security_group.securitygroup.name}"
}

output "security_rule" {
    description = "Rules do security group criado."
    value       = "${azurerm_network_security_group.securitygroup.security_rule}"
}
