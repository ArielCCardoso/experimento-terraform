#Main
provider "azurerm" {
}

module "network" {
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    source              = "../../modules/network"
}


