/*
    Arquivo que resulta nas saídas das Subnets criados na Azure.
*/

output "subnet_name" {
    description = "Nome da subnet criada."
    value       = "${azurerm_subnet.subnet.*.name}"
}

output "subnet_id" {
    description = "Nome da subnet criada."
    value       = "${azurerm_subnet.subnet.*.id}"
}

output "subnet_address_prefix" {
    description = "Nome da subnet criada."
    value       = "${azurerm_subnet.subnet.*.address_prefix}"
}
