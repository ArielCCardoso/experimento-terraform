/*
    Arquivo de declara a variaveis para criar o recurso de rede na Azure.
*/

#Variaveis do modulo
variable "resource_group_name" { }

variable "location" { }

variable "tags" {
	type = "map"
}

variable "name" {
	description = "Nome da vNet criada"
	type        = "string"
	default     = "vnet-default"
}

variable "address_space" {
	/*
        O CIDR pode ser declarado somente como list, sendo possivel passar mais um endereçamento de rede para a vNet.
    */
	description = "CIDR da vNet criada."
	type    = "list"
	default = ["192.168.0.0/16"]
}

variable "dns_servers" {
	# If no values specified, this defaults to Azure DNS 
	description = "DNS servers usados pela vNet."
	type        = "list"
	default     = [""]
}
