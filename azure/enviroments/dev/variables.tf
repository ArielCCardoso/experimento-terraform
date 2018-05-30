/*
    Arquivo de declara, define e atribui valores e tipos de valores as variaveis para criar os recursos na Azure.
*/
#Inputs variavel 'tags'
locals {
    inputs {
        Environment = "${var.env}"
        Project     = "project-${var.project}"
    }
}

#Global
variable "location" {
    description = "Local/Região onde serão criados os recursos. Para consulta completa acesse: https://azure.microsoft.com/regions"
    type        = "string"
    default     = "location-default"
}

variable "tags" {
    description = "Tags associadas aos recursos criados na Azure."
    type        = "map"
    default     = {
        #Environment = "${local.inputs.Environment}"
        Provisioner = "Terraform"
        #Project     = ${format("%s", (join("", ["public", var.project])))}
    }
}

#Modulo resourcegroup
variable "resource_group_name" {
    description = "Nome do Resource Group usado para para criar a vNet."
    type        = "string"
    default     = "resourcegroup-default"
}

#Modulo network
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



