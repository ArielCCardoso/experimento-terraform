/*
    Arquivo que cria o resource group na Azure.
*/

resource "azurerm_resource_group" "resourcegroup" {
  name     = "${var.name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}
