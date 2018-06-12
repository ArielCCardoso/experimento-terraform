/*
    Arquivo de declara a variaveis para criar as subnets na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }
variable "tags" { type = "map" }
variable "location" { }

variable "name" { 
    description = "Nome da interface de rede a ser criada."
    type        = "string"
    default     = "nic-default"
}

variable "network_security_group_id" { 
    description = "ID do grupo de segurança a ser attachado na interface de rede."
    type        = "string"
    default     = ""
}

variable "internal_dns_name_label" { 
    description = "Habilita o encaminhamento de IP na interface de rede."
    type        = "string"
    default     = ""
}

variable "enable_ip_forwarding" { 
    description = "Habilita o encaminhamento de IP na interface de rede."
    type        = "string"
    default     = "false"
}

variable "enable_accelerated_networking" {
    description = "Habilita a aceleração de rede, para maiores detalhes consulta a documentação: https://docs.microsoft.com/en-us/azure/virtual-network/create-vm-accelerated-networking-cli."
    type        = "string"
    default     = "false"
}

variable "dns_servers" { 
    description = "Servidores DNS para a inteface de rede."
    type        = "list"
    default     = []
}

variable "ip_configuration" { 
    description = "Configurações de IP para a interface de rede. Para maiores detalhes, consulte a documentação de valores suportador pelo bloco ip_configuration: https://www.terraform.io/docs/providers/azurerm/r/network_interface.html"
    type        = "map"
    default     = {
        name                          = "defaultIPConfiguration"
        private_ip_address_allocation = "dynamic"
        primary                       = "true"

    }
}
