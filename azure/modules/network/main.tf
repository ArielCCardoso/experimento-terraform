#Main
provider "azurerm" {
}

resource "azurerm_virtual_network" "vnet" {
    name                = "${var.vnet_name}"
    address_space       = "${var.address_spaces}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    subnet {
        name           = "${var.subnet_name}"
        address_prefix = "${var.subnet_prefix}"
    }
    #subnet_name         = "${var.subnet_names}"
    #subnet_prefixe      = "${var.subnet_prefixes}"
    #dns_servers         = "${var.dns_servers}"
    tags                = "${var.tags}"
}