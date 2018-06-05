/*
    Arquivo de declara a variaveis para criar as subnets na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }
variable "vnet_name" {}
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
            address_prefix = "10.0.0.0/16"
        }
    ]
}

