#Main

resource "azurerm_resource_group" "myterraformgroup" {
    name     = "teste-tf"
    location = "eastus"
    tags {
        environment = "Terraform Demo"
    }
}