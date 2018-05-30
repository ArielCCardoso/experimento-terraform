#Main
terraform {
    #TODO
    # CONFIGURAR VERSÕES DO TERRAFORM
    #required_version = "> 0.7.0"
}

provider "azurerm" {
    #TODO
    # CONFIGURAR VERSÕES DO PLUGIN
}

#Inputs variavel 'tags'
locals {
    tags {
        Environment = "${var.env}"
        Project     = "${var.project}"
    }
    resource_group_name = "${var.resource_group_name}-${var.env}"
}

module "resourcegroup" {
    resource_group_name = "${local.resource_group_name}"
    location            = "${var.location}"
    tags                = "${merge(local.tags, var.tags)}"
    #tags = "${var.tags}"
    source              = "../../modules/resourcegroup"
}

module "network" {
    vnet_name           = "${var.vnet_name}"
    location            = "${var.location}"
    resource_group_name = "${var.resource_group_name}"
    vnet_address_space  = "${var.vnet_address_space}"
    vnet_subnet_name    = "${var.vnet_subnet_name}"
    vnet_subnet_prefix  = "${var.vnet_subnet_prefix}"
    tags                = "${merge(local.tags, var.tags)}"
    source              = "../../modules/network"
}


