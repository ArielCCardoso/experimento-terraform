/*
    Arquivo de declara, define e atribui valores e tipos de valores as variaveis para criar os recursos na Azure.
*/

#Inputs
variable env { }

variable project { }

#Global
variable "location" {
	description = "Local/Região onde serão criados os recursos. Para consulta completa acesse: https://azure.microsoft.com/regions"
	type        = "string"
	default     = "East US 2"
}

variable "tags" {
	description = "Tags associadas aos recursos criados na Azure."
	type        = "map"
	default = {
	    Maintenance = "Ariel C. Cardoso"
	    ISV         = "TRIAD Systems"
	    Diretoria   = "Big Data"
	    Area        = "4th Platform"
	    Frente      = "DevOps"
	    Provisioner = "Terraform"
	}
}

#Modulo resourcegroup
variable "resource_group_name" { }

#Modulo network
variable "vnet_name" { }

variable "vnet_address_space" {
	type = "list"
}

variable "vnet_dns_servers" {
	type = "list"
}

#Modulo subnet
variable "subnets" {
	type = "list"
}

#Modulo networkinterface
variable "networkinterfaces" {
	type = "list"
}

#variable "networkinterface_public_ip" { }
variable "public_ips_ids" {
	type = "list"
}
