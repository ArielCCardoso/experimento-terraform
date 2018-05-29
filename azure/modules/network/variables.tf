/*
    Arquivo de declara a variaveis para criar o recurso de rede na Azure.
*/

variable "resource_group_name" {
    description = "Nome do Resource Group usado para para criar a vNet."
    type        = "string"
    default     = "rg-default"
}

variable "vnet_name" {
    description = "Nome da vNet criada"
    type        = "string"
    default     = "vnet-default"
}

variable "location" {
    description = "Local/Região onde serão criados os recursos. Para consulta completa acesse: https://azure.microsoft.com/regions"
    type        = "string"
    default     = "location-default"
}

variable "address_spaces" {
    /*
        O CIDR pode ser declarado somente como list, sendo possivel passar mais um endereçamento de rede para a vNet.
    */
    description = "CIDR da vNet criada."
    type        = "list"
    default     = ["10.200.0.0/23"]

}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
    description = "DNS servers usados pela vNet."
    type        = "list"
    default     = []
}

variable "subnet_prefix" {
    /*
        Pode ser declarado somente como string!
        Estudar viabilidade de passar mais um valor.
    */
    description = "Endereçamento da subnet."
    type        = "string"
    default     = "10.200.0.0/25"
}

variable "subnet_name" {
    /*
        Pode ser declarado somente como string!
        Estudar viabilidade de passar mais um valor.
    */
    description = "Nome ou lista das subnets criadas na vNet."
    type        = "string"
    default     = "subnet-default"
}

variable "tags" {
    description = "Tags associadas a vNet e Subnets criadas."
    type        = "map"
    default     = {
        Environment = "dev"
        Project     = "DevOps"
    }
}