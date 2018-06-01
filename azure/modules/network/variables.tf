/*
    Arquivo de declara a variaveis para criar o recurso de rede na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }
variable "location" { }

variable "tags" {
    type        = "map"
}

variable "vnet_name" {
    description = "Nome da vNet criada"
    type        = "string"
    default     = "vnet-default"
}

variable "vnet_address_space" {
    /*
        O CIDR pode ser declarado somente como list, sendo possivel passar mais um endereçamento de rede para a vNet.
    */
    description = "CIDR da vNet criada."
    type        = "list"
    default     = ["10.200.0.0/23"]

}

variable "vnet_dns_servers" {
    # If no values specified, this defaults to Azure DNS 
    description = "DNS servers usados pela vNet."
    type        = "list"
    default     = []
}

variable "vnet_subnet_prefix" {
    /*
        Pode ser declarado somente como string!
        Estudar viabilidade de passar mais um valor.
    */
    description = "Endereçamento da subnet."
    type        = "string"
    default     = "10.200.0.0/25"
}

variable "vnet_subnet_name" {
    /*
        Pode ser declarado somente como string!
        Estudar viabilidade de passar mais um valor.
    */
    description = "Nome ou lista das subnets criadas na vNet."
    type        = "string"
    default     = "subnet-default"
}
