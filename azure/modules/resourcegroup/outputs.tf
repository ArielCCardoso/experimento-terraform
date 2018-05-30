/*
    Arquivo que resulta nas saídas do resourcegroup criado na Azure.
*/

output "id" {
    description = "Id do resource group criado."
    value       = "${azurerm_resource_group.resourcegroup.id}"
}

output "resource_group_name" {
    description = "Nome do resource group criado."
    value       = "${azurerm_resource_group.resourcegroup.name}"
}
