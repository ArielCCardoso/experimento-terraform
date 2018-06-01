/*
    Arquivo de declara a variaveis para criar o resource group na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" {
    description = "Nome do Resource Group usado para para criar a vNet."
    type        = "string"
    default     = "resourcegroup-default"
}

variable "location" { }

variable "tags" {
    type = "map"
 }
