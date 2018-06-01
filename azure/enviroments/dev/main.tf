#Main
terraform {
    /*
    backend "azurerm" {
        resource_group_name  = ""
        storage_account_name = ""
        container_name       = "terraform"
        access_key           = ""
        key                  = "poc.devops.terraform.tfstate"
    }
    */
    #TODO
    # CONFIGURAR VERSÕES DO TERRAFORM
    #required_version = "> 0.7.0"
}

provider "azurerm" {
    #TODO
    # CONFIGURAR VERSÕES DO PLUGIN
}
provider "null" {}

#Concatenação de valores padrões com as entradas de ambiente e projeto.
locals {
    tags = {
        Environment = "${var.env}"
        Project     = "${var.project}"
    }
    resource_group_name = "${var.resource_group_name}-${var.project}-${var.env}"
    vnet_name           = "${var.vnet_name}-${var.project}-${var.env}"
    vnet_subnet_name    = "${var.vnet_subnet_name}-${var.project}-${var.env}"
}

module "resourcegroup" {
    resource_group_name = "${local.resource_group_name}"
    location            = "${var.location}"
    tags                = "${merge(local.tags, var.tags)}"
    source              = "../../modules/resourcegroup"
}
resource "null_resource" "wait_resourcegroup" {
    #depends_on = ["module.resourcegroup"]
    /*provisioner "local-exec" {
        command = "sleep 20"
        interpreter = ["bash", "-c"]
    }*/
}

module "network" {
    vnet_name           = "${local.vnet_name}"
    location            = "${var.location}"
    resource_group_name = "${module.resourcegroup.resource_group_name}"
    vnet_address_space  = "${var.vnet_address_space}"
    vnet_subnet_name    = "${local.vnet_subnet_name}"
    vnet_subnet_prefix  = "${var.vnet_subnet_prefix}"
    tags                = "${merge(local.tags, var.tags)}"
    source              = "../../modules/network"
}
resource "null_resource" "wait_network" {
    #depends_on = ["module.network"]
}

