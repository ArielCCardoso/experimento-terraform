/*
    Arquivo de declara a variaveis para criar as grupos de segurança na Azure.
*/

variable "tags" { type = "map" }
variable "location" { }
variable "resource_group_name" { }

variable "name" {
    description = "Nome do grupo de segurança."
    type = "string" 
    default = "nsg-default"
}
