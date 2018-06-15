/*
    Arquivo que resulta nas saídas das Subnets criados na Azure.
*/
output "id" {
	description = "Nome da subnet criada."
	value       = "${azurerm_subnet.subnet.id}"
}

output "name" {
	description = "Nome da subnet criada."
	value       = "${azurerm_subnet.subnet.name}"
}

output "address_prefix" {
	description = "Nome da subnet criada."
	value       = "${azurerm_subnet.subnet.address_prefix}"
}
