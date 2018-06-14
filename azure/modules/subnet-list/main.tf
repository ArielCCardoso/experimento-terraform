/*
    Arquivo que cria os recursos de rede na Azure.
*/

resource "azurerm_subnet" "subnet" {
  count                     = "${length(var.subnets)}"
  name                      = "${lookup(var.subnets[count.index], "name")}"
  address_prefix            = "${lookup(var.subnets[count.index], "address_prefix")}"
  resource_group_name       = "${var.resource_group_name}"
  virtual_network_name      = "${var.virtual_network_name}"
  network_security_group_id = "${var.network_security_group_id}"
  route_table_id            = "${var.route_table_id}"

  #service_endpoints         = "${lookup(var.subnets[count.index], "service_endpoints")}"
}
