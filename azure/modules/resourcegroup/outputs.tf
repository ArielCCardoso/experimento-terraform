/*
    Arquivo que resulta nas saídas do resourcegroup criado na Azure.
*/

output "id" {
    description = "Id do resource group criado."
    value       = "${azurerm_resource_group.resourcegroup.id}"
}

output "name" {
    description = "Nome do resource group criado."
    value       = "${azurerm_resource_group.resourcegroup.name}"
}
