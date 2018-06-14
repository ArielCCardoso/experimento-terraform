/*
    Arquivo que resulta nas saídas das Subnets criados na Azure.
*/

output "name" {
  description = "Nome da subnet criada."
  value       = "${azurerm_subnet.subnet.*.name}"
}

output "id" {
  description = "Nome da subnet criada."
  value       = "${azurerm_subnet.subnet.*.id}"
}

output "address_prefix" {
  description = "Nome da subnet criada."
  value       = "${azurerm_subnet.subnet.*.address_prefix}"
}
