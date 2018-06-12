/*
    Arquivo que resulta nas saídas das rotas criadas na Azure.
*/

output "id" {
    description = "Id da rota criada."
    value       = "${azurerm_route.route.id}"
}

output "name" {
    description = "Nome da rota criada."
    value       = "${azurerm_route.route.name}"
}

output "address_prefix" {
    description = "Endereço de destino da rota."
    value       = "${azurerm_route.route.address_prefix}"
}
