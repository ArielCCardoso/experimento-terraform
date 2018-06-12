/*
    Arquivo de declara a variaveis para criar as subnets na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }
variable "virtual_network_name" {}
variable "tags" { type = "map" }
variable "location" { }
/*
variable "subnets" {
    
        O código foi implementado para ser possivel criar uma ou mais subnets numa unica chamada do modulo.
    
    description = "Subnet criada na vNet da Azure.."
    type        = "list"
    default     = [
        {
            name = "subnet-default"
            address_prefix = "10.0.0.0/16"
        }
    ]
}
*/
variable "name" {
    description = "Nome da Subnet criada na Azure."
    type        = "string"
    default     = "subnet-default"
}
variable "address_prefix" {
    description = "Endereçamento da subnet criada na Azure."
    type        = "string"
    default     = "192.168.0.0/23"
}
variable "service_endpoints" {
    /*
        Possivei valores aceitos para esta varivel: Microsoft.Storage, Microsoft.Sql (para maiores detalhes, consultar a documentação: https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-service-endpoints-overview)
    */
    description = "Lista de serviço que associados a Subnet."
    type        = "list"
    default     = []
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
