/*
    Arquivo que declara a variaveis para criar tabelas de rotas na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }
variable "location" { }
variable "tags" { type = "map" }

variable "name" {
    description = "Nome da tabela de rotas"
    type        = "string"
    default     = "routetable-default"
}
