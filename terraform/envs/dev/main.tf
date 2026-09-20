data "azurerm_resource_group" "dev" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.project}-dev"
  resource_group_name = data.azurerm_resource_group.dev.name
  location            = data.azurerm_resource_group.dev.location
  address_space       = ["10.10.0.0/16"]

  tags = {
    project    = var.project
    managed_by = "terraform"
    root       = "envs/dev"
  }
}