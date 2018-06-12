/*
    Arquivo que cria grupos de segurança na Azure.
*/

resource "azurerm_network_security_group" "securitygroup" {
    #count               = "${length(var.securitygroups)}"
    name                = "${var.security_group_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    tags                = "${var.tags}"
}
