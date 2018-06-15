/*
    Arquivo que cria os recursos de rede na Azure.
*/
locals {
	dns_servers_count = "${length(var.dns_servers)}"
	dns_servers_null  = []
}

resource "azurerm_virtual_network" "network" {
	name                = "${var.name}"
	location            = "${var.location}"
	resource_group_name = "${var.resource_group_name}"
	address_space       = "${var.address_space}"
	dns_servers         = "${var.dns_servers}"
	#dns_servers = "${local.dns_servers_count == 0 ? list() : var.dns_servers }"
	#"${lookup(var.networkinterfaces[count.index], "public_ip") == "true" ? "${var.public_ips_ids[count.index]}" : ""}"
	tags                = "${var.tags}"
}
