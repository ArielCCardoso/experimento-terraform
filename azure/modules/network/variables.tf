/*
    Arquivo de declara a variaveis para criar o recurso de rede na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }

variable "location" { }

variable "tags" {
    type = "map"
 }

variable "vnet_name" { }

variable "vnet_address_space" {
    type = "list"
 }

#variable "vnet_dns_servers" { }

variable "vnet_subnet_prefix" { }

variable "vnet_subnet_name" { }
