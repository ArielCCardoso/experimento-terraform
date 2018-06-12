/*
    Arquivo de declara a variaveis para criar as grupos de segurança na Azure.
*/

variable "resource_group_name" { }
variable "route_table_name" { }

variable "name" {
    description = "Nome da rota de rede."
    type = "string" 
    default = "route-default"
}

variable "address_prefix" {
    description = "CIDR de destino que será aplicada a rota."
    type = "string" 
    default = "192.168.0.0/16"
}

variable "next_hop_type" {
    description = "Tipo Azure onde o pacote será enviado. Valores possiveis: VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance e None."
    type = "string" 
    default = "vnetlocal"
}

variable "next_hop_in_ip_address" {
    description = "Endereço IP onde os pacotes serão enviados, este é indicado somente se o atributo next_hop_type possuir valor 'VirtualAppliance'."
    type = "string" 
    default = ""
}
