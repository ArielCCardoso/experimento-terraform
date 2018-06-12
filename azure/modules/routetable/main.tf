/*
    Arquivo que cria tabelas de rede na Azure.
*/

resource "azurerm_route_table" "routetable" {
    name                = "${var.name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    tags                = "${var.tags}"
}