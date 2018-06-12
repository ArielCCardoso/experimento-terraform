/*
    Arquivo que resulta nas saídas das tabelas de rotas criadas na Azure.
*/

output "id" {
    description = "Id da vNet criada."
    value       = "${azurerm_route_table.routetable.id}"
}

output "name" {
    description = "Nome da vNet criada."
    value       = "${azurerm_route_table.routetable.name}"
}

