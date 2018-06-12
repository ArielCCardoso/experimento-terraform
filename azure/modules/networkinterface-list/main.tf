/*
    Arquivo que cria interfaces de rede na Azure.
*/
/*
if ${var.networkinterface_public_ip} {
    resource "azurerm_network_interface" "networkinterface" {
        name                      = "${var.location}"
        location                  = "${var.location}"
        resource_group_name       = "${var.resource_group_name}"
        #network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

        ip_configuration {
            nname                          = "${lookup(var.networkinterfaces[count.index], "name")}-ip_conf"
            subnet_id                     = "${var.vnet_id}/subnets/${lookup(var.networkinterfaces[count.index], "subnet_name")}"
            private_ip_address_allocation = "${var.networkinterface_allocation_private_ip}"
            public_ip_address_id          = "${var.publicip_id}"
        }

        tags = "${var.tags}"
    }
} else {
    resource "azurerm_network_interface" "networkinterface" {
        count                     = "${length(var.networkinterface)}"
        name                      = "${lookup(var.networkinterface[count.index], "name")}"
        location                  = "${var.location}"
        resource_group_name       = "${var.resource_group_name}"
        #network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"

        ip_configuration {
            name                          = "${lookup(var.networkinterfaces[count.index], "name")}-ip_conf"
            subnet_id                     = "${var.vnet_id}/subnets/${lookup(var.networkinterfaces[count.index], "subnet_name")}"
            private_ip_address_allocation = "${lookup(var.networkinterfaces[count.index], "ip_address_allocation")}"
            #public_ip_address_id          = "${var.publicip_id}"
        }

        tags = "${var.tags}"
    }
}
*/  
/*
#"${var.env == "production" ? var.prod_subnet : var.dev_subnet}"
if "${var.networkinterface_public_ip}" {
    resource "azurerm_network_interface" "networkinterface" {
        count                     = "${length(var.networkinterfaces)}"
        name                      = "${lookup(var.networkinterfaces[count.index], "name")}"
        location                  = "${var.location}"
        resource_group_name       = "${var.resource_group_name}"
        #network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"
        ip_configuration {
            name                          = "${lookup(var.networkinterfaces[count.index], "name")}-ip_conf"
            subnet_id                     = "${var.vnet_id}/subnets/${lookup(var.networkinterfaces[count.index], "subnet_name")}"
            private_ip_address_allocation = "${lookup(var.networkinterfaces[count.index], "ip_address_allocation")}"
            public_ip_address_id          = "${var.public_ips_ids[count.index]}"
        }
        tags = "${var.tags}"
    }
} else {
        resource "azurerm_network_interface" "networkinterface" {
        count                     = "${length(var.networkinterfaces)}"
        name                      = "${lookup(var.networkinterfaces[count.index], "name")}"
        location                  = "${var.location}"
        resource_group_name       = "${var.resource_group_name}"
        #network_security_group_id = "${azurerm_network_security_group.myterraformnsg.id}"
        ip_configuration {
            name                          = "${lookup(var.networkinterfaces[count.index], "name")}-ip_conf"
            subnet_id                     = "${var.vnet_id}/subnets/${lookup(var.networkinterfaces[count.index], "subnet_name")}"
            private_ip_address_allocation = "${lookup(var.networkinterfaces[count.index], "ip_address_allocation")}"
            #public_ip_address_id          = "${lookup(var.networkinterfaces[count.index], "public_ip") == "true" ? var.public_ips_ids[count.index] : ""}"
        }
        tags = "${var.tags}"
    }
}

locals {
    resource_group_id = "${var.resource_group_id}/providers/Microsoft.Network/publicIPAddresses/"
    #public_ip_name    = "${lookup(var.networkinterfaces[count.index], "public_ip_name")}"
    #public_ip_id      = "${local.resource_group_id}${local.public_ip_name}"
    public_ip_id = ""
    public_ip_name = ""
}
*/
resource "azurerm_network_interface" "networkinterface" {
    count                         = "${length(var.networkinterfaces)}"
    name                          = "${lookup(var.networkinterfaces[count.index], "name")}"
    location                      = "${var.location}"
    resource_group_name           = "${var.resource_group_name}"
    network_security_group_id     = "${lookup(var.networkinterfaces[count.index], "network_security_group_id")}"
    internal_dns_name_label       = "${lookup(var.networkinterfaces[count.index], "internal_dns_name_label")}"
    enable_ip_forwarding          = "${lookup(var.networkinterfaces[count.index], "enable_ip_forwarding")}"
    enable_accelerated_networking = "${lookup(var.networkinterfaces[count.index], "enable_accelerated_networking")}"
    dns_servers                   = "${var.dns_servers}"
    ip_configuration {
        name                                          = "${lookup(var.networkinterfaces[count.index], "name")}-ip_conf"
        subnet_id                                     = "${var.virtual_network_id}/subnets/${lookup(var.networkinterfaces[count.index], "subnet_name")}"
        private_ip_address_allocation                 = "${lookup(var.networkinterfaces[count.index], "ip_address_allocation")}"
        #public_ip_address_id                         = "${var.networkinterface_public_ip == "true" ? "" : var.public_ips_ids[count.index]}"
        public_ip_address_id                          = "${lookup(var.networkinterfaces[count.index], "public_ip") == "true" ? "${var.public_ips_ids[count.index]}" : ""}"
        #public_ip_address_id                         = "${lookup(var.networkinterfaces[count.index], "public_ip") == "true" ? "${local.resource_group_id}${lookup(var.networkinterfaces[count.index], "public_ip_name")}" : ""}"
        application_gateway_backend_address_pools_ids = "${lookup(var.networkinterfaces[count.index], "application_gateway_backend_address_pools_ids")}"
        load_balancer_backend_address_pools_ids       = "${lookup(var.networkinterfaces[count.index], "load_balancer_backend_address_pools_ids")}"
        load_balancer_inbound_nat_rules_ids           = "${lookup(var.networkinterfaces[count.index], "load_balancer_inbound_nat_rules_ids")}"
        application_security_group_ids                = "${lookup(var.networkinterfaces[count.index], "application_security_group_ids")}"
        primary                                       = "${lookup(var.networkinterfaces[count.index], "primary")}"
    }
    tags = "${var.tags}"
}