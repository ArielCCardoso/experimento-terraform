/*
    Arquivo que resulta nas saídas das interfaces de redes criadas na Azure.
*/
output "id" {
    description = "ID da inteface de rede criada."
    value       = "${azurerm_network_interface.networkinterface.id}"
}

output "name" {
    description = "Nome da inteface de rede criada."
    value       = "${azurerm_network_interface.networkinterface.name}"
}

output "ip_configuration" {
    description = "Configurações de IP da inteface de rede criada."
    value       = "${azurerm_network_interface.networkinterface.ip_configuration}"
}

output "mac_address" {
    description = "MAC Address da inteface de rede criada"
    value       = "${azurerm_network_interface.networkinterface.mac_address}"
}