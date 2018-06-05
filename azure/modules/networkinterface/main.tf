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
*/
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
        #public_ip_address_id          = "${var.networkinterface_public_ip == "true" ? "" : var.public_ips_ids[count.index]}"
        public_ip_address_id          = "${lookup(var.networkinterfaces[count.index], "public_ip") == "true" ? var.public_ips_ids[count.index] : ""}"
    }
    tags = "${var.tags}"
}