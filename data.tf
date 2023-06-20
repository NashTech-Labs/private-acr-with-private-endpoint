data "azurerm_virtual_network" "acr_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_vnet_name
}

data "azurerm_subnet" "acr_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_vnet_name
  virtual_network_name = var.vnet_name
}
