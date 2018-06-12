/*
    Arquivo de declara a variaveis para criar as rules de segurança na Azure.
*/

variable "resource_group_name" { }
variable "network_security_group_name" { }

variable "name" {
    description = "Nome da rule de segurança."
    type = "string" 
    default = "rule-default"
}

variable "description" {
    description = "Descrição da rule de segurança."
    type = "string" 
    default = "Rule default criada para os recursos na Azure."
}

variable "priority" {
    description = "Prioridade da rule de segurança."
    type = "string" 
    default = "100"
}

variable "direction" {
    description = "Direção da rule de segurança, o valor pode ser Inbound ou Outbound."
    type = "string" 
    default = "Inbound"
}

variable "access" {
    description = "Tipo de acesso da rule de segurança, o valor pode ser Allow ou Deny."
    type = "string" 
    default = "Allow"
}

variable "protocol" {
    description = "Protocolo da rule de segurança, o valor pode ser Tcp, Udp ou *."
    type = "string" 
    default = "Tcp"
}

variable "source_port_range" {
    description = "Porta ou range de portas de origem da rule de segurança, o valor pode ser uma unica porta, um range de portas e qualquer porta. Ex: 8080 ou 8080-8090 ou *. É obrigatório se source_port_ranges não for especificado"
    type = "string" 
    default = ""
}

variable "source_port_ranges" {
    description = "Lista de portas ou ranges de portas de origem da rule de segurança, o valor pode ser uma unica porta, um range de portas e qualquer porta. Ex: [22,80,8080-8090]. É obrigatório se source_port_range não for especificado."
    type = "list" 
    default = []
}

variable "destination_port_range" {
    description = "Porta ou range de portas de destino da rule de segurança, o valor pode ser uma unica porta, um range de portas e qualquer porta. Ex: 8080 ou 8080-8090 ou *. É obrigatório se destination_port_ranges não for especificado."
    type = "string" 
    default = ""
}

variable "destination_port_ranges" {
    description = "Lista de portas ou ranges de portas de destino da rule de segurança, o valor pode ser uma unica porta, um range de portas e qualquer porta. Ex: [22,80,8080-8090]. É obrigatório se destination_port_range não for especificado."
    type = "list" 
    default = []
}

variable "source_address_prefix" {
    description = "Prefixo de origem da rule. Pode ser um IP, CIDR, * ou Service tags (AzureLoadBalancer, Internet, VirtualNetwork, Sql e entre outros, consulte a documentação: https://docs.microsoft.com/en-us/azure/virtual-network/security-overview). É obrigatório se source_address_prefixes não for especificado."
    type = "string" 
    default = ""
}

variable "source_address_prefixes" {
    description = "Lista de prefixos de origem da rule. Podem ser IPs e CIDRs. É obrigatório se source_address_prefixe não for especificado."
    type = "list" 
    default = []
}

variable "destination_address_prefix" {
    description = "Prefixo de origem da rule. Pode ser um IP, CIDR, * ou Service tags (AzureLoadBalancer, Internet, VirtualNetwork, Sql e entre outros, consulte a documentação: https://docs.microsoft.com/en-us/azure/virtual-network/security-overview). É obrigatório se destination_address_prefixes não for especificado."
    type = "string" 
    default = ""
}

variable "destination_address_prefixes" {
    description = "Lista de prefixos de destino da rule. Podem ser IPs e CIDRs. É obrigatório se destination_address_prefixe não for especificado."
    type = "list" 
    default = []
}

variable "source_application_security_group_ids" {
    description = "Lista de IDs de origem dos grupos de aplicações de segurança. Consulte a docuemntação: https://docs.microsoft.com/en-us/azure/virtual-network/security-overview#application-security-groups."
    type = "list" 
    default = []
}

variable "destination_application_security_group_ids" {
    description = "Lista de IDs de destino dos grupos de aplicações de segurança. Consulte a docuemntação: https://docs.microsoft.com/en-us/azure/virtual-network/security-overview#application-security-groups."
    type = "list" 
    default = []
}
