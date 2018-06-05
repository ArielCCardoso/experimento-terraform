/*
    Arquivo que resulta nas saídas das interfaces de redes criadas na Azure.
*/

output "network_inteface_name" {
    description = "Nome da subnet criada."
    value       = "${azurerm_network_interface.networkinterface.*.name}"
}

output "network_inteface_id" {
    description = "Nome da subnet criada."
    value       = "${azurerm_network_interface.networkinterface.*.id}"
}

output "network_inteface_ip_configuration" {
    description = "Nome da subnet criada."
    value       = "${azurerm_network_interface.networkinterface.*.ip_configuration}"
}

