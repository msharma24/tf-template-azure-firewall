resource "random_id" "random_id" {
  byte_length = 3
}
resource "azurerm_resource_group" "resource-group" {
  name     = "${var.resource_group_name}-${random_id.random_id.hex}-rg"
  location = "Australia East"
}

resource "azurerm_virtual_network" "vnet" {
   name = "virtualNetwork1-${random_id.random_id.hex}"
   location = azurerm_resource_group.resource-group.location
   resource_group_name = azurerm_resource_group.resource-group.name
   address_space = ["10.0.0.0/16"]
}
