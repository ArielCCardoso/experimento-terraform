/*
    Arquivo de declara a variaveis para criar as subnets na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }
variable "virtual_network_name" {}
variable "tags" { type = "map" }
variable "location" { }

variable "subnets" {
    /*
        O código foi implementado para ser possivel criar uma ou mais subnets numa unica chamada do modulo.
    */
    description = "Subnet criada na vNet da Azure.."
    type        = "list"
    default     = [
        {
            name = "subnet-default"
            address_prefix = "192.168.0.0/23"
        }
    ]
}

variable "network_security_group_id" {
    description = "ID do grupo de segurança aplicado na Sunet."
    type        = "string"
    default     = ""
}

variable "route_table_id" {
    description = "ID da tabela de rotas da Subnet."
    type        = "string"
    default     = ""
}

