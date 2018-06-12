/*
    Arquivo que cria grupos de segurança na Azure.
*/

resource "azurerm_network_security_group" "securitygroup" {
    count               = "${length(var.securitygroups)}"
    name                = "${lookup(var.securitygroups[count.index], "name")}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    tags                = "${var.tags}"
}
