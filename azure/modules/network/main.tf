/*
    Arquivo que cria os recursos de rede na Azure.
*/

resource "azurerm_virtual_network" "network" {
  name                = "${var.name}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  address_space       = "${var.address_space}"
  dns_servers         = "${var.dns_servers}"

  /*
          subnet = {
              name            = "${var.vnet_subnet_name}"
              address_prefix  = "${var.vnet_subnet_prefix}"
          }
          */
  tags = "${var.tags}"
}
