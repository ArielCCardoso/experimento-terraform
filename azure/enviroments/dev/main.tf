#Main
provider "azurerm" {
}

module "resourcegroup" {
    resource_group_name = "${var.resource_group_name}"
    location            = "${var.location}"
    tags                = "${merge(local.inputs, var.tags)}"
    source              = "../../modules/resourcegroup"
}

module "network" {
    vnet_name           = "${var.vnet_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    vnet_address_space  = "${var.vnet_address_space}"
    vnet_subnet_name    = "${var.vnet_subnet_name}"
    vnet_subnet_prefix  = "${var.vnet_subnet_prefix}"
    tags                = "${merge(local.inputs, var.tags)}"
    source              = "../../modules/network"
}


