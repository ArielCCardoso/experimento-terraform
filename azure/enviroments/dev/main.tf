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
    */  #TODO  # CONFIGURAR VERSÕES DO TERRAFORM  #required_version = "> 0.7.0"
}

provider "azurerm" {
    #TODO  # CONFIGURAR VERSÕES DO PLUGIN
    version = "1.5.0"
}

#provider "null" {}

#Concatenação de valores padrões com as entradas de ambiente e projeto.
locals {
    tags = {
        Environment = "${var.env}"
        Project     = "${var.project}"
    }
    resource_group_name = "${var.resource_group_name}-${var.project}-${var.env}"
    vnet_name           = "${var.vnet_name}-${var.project}-${var.env}"
    #vnet_subnet_name    = "${var.vnet_subnet_name}-${var.project}-${var.env}"
}

module "resourcegroup" {
    name     = "${local.resource_group_name}"
    location = "${var.location}"
    tags     = "${merge(local.tags, var.tags)}"
    source   = "../../modules/resourcegroup"
}

/*
resource "null_resource" "wait_resourcegroup" {
    depends_on = ["module.resourcegroup"]
}
*/

module "network" {
    name                = "${local.vnet_name}"
    location            = "${var.location}"
    resource_group_name = "${module.resourcegroup.name}"
    address_space       = "${var.vnet_address_space}"
    #dns_servers         = "${var.vnet_dns_servers}"
    tags = "${merge(local.tags, var.tags)}"
    source = "../../modules/network"
}

/*
resource "null_resource" "wait_network" {
    depends_on = ["module.network"]
}
*/

module "subnet" {
    virtual_network_name = "${module.network.name}"
    location             = "${var.location}"
    resource_group_name  = "${module.resourcegroup.name}"
    subnets              = "${var.subnets}"
    tags                 = "${merge(local.tags, var.tags)}"
    source               = "../../modules/subnet-list"
}

/*
resource "null_resource" "wait_subnet" {
    depends_on = ["module.subnet"]
}
*/

module "networkinterface" {
    networkinterfaces   = "${var.networkinterfaces}"
    location            = "${var.location}"
    resource_group_name = "${module.resourcegroup.name}"
    #resource_group_id   = "${module.resourcegroup.resource_group_id}"
    virtual_network_id = "${module.network.id}"
    public_ips_ids     = "${var.public_ips_ids}"
    tags               = "${merge(local.tags, var.tags)}"
    source             = "../../modules/networkinterface-list"
}

/*
resource "null_resource" "networkinterface" {
    depends_on = ["module.networkinterface"]
}
*/

