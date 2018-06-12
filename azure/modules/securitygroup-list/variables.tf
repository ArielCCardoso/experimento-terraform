/*
    Arquivo de declara a variaveis para criar as grupos de segurança na Azure.
*/

variable "tags" { type = "map" }
variable "location" { }
variable "resource_group_name" { }

variable "securitygroups" {
    description = "Lista dos grupos de segurança."
    type = "list" 
    default = ["nsg-default"]
}
