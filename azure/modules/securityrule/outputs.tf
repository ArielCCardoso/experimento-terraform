/*
    Arquivo que resulta nas saídas das rules de segurança criadas na Azure.
*/

output "id" {
    description = "Id do security group criado."
    value       = "${azurerm_network_security_rule.securityrule.id}"
}

output "name" {
    description = "Nome do security group criado."
    value       = "${azurerm_network_security_rule.securityrule.name}"
}

