/*
    Arquivo que cria interfaces de rede na Azure.
*/

resource "azurerm_network_interface" "networkinterface" {
    name                          = "${var.name}"
    location                      = "${var.location}"
    resource_group_name           = "${var.resource_group_name}"
    network_security_group_id     = "${var.network_security_group_id}"
    internal_dns_name_label       = "${var.internal_dns_name_label}"
    enable_ip_forwarding          = "${var.enable_ip_forwarding}"
    enable_accelerated_networking = "${var.enable_accelerated_networking}"
    dns_servers                   = "${var.dns_servers}"
    ip_configuration              = "${var.ip_configuration}"
    tags                          = "${var.tags}"
}
