/*
    Arquivo de declara a variaveis para criar as subnets na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }
variable "virtual_network_id" { }
variable "tags" { type = "map" }
variable "location" { }

/*
variable "networkinterface_public_ip" { 
    description = "Decisão se as interfaces de rede terão ip publico."
    type = "string" 
    default = false
}
*/

variable "public_ips_ids" {
    description = "Lista dos IPs publicos que serão attachados nas interfaces de rede."
    type = "list" 
    default = []
}

variable "networkinterfaces" {
    /*
        O tipo de ip_address_allocation pode ser: dynamic ou static.
    */
    description = "Configuração da Interface de rede."
    type        = "list"
    default     = [
        {
            name                  = "nic-default"
            ip_address_allocation = "dynamic"
            subnet_name           = "subnet-default"
        }
    ]
}

variable "dns_servers" { 
    description = "Servidores DNS para a inteface de rede."
    type        = "list"
    default     = []
}
