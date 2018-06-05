/*
    Arquivo que cria os recursos de rede na Azure.
*/

resource "azurerm_subnet" "subnet" {
    count                     = "${length(var.subnets)}"
    name                      = "${lookup(var.subnets[count.index], "name")}"
    address_prefix            = "${lookup(var.subnets[count.index], "address_prefix")}"
    resource_group_name       = "${var.resource_group_name}"
    virtual_network_name      = "${var.vnet_name}"
    network_security_group_id = ""
    route_table_id            = ""
}
