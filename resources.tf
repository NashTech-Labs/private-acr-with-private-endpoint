#############
# RESOURCES #
#############

# Create azure resource group
resource "azurerm_resource_group" "acr_resource_group" {
  name     = var.acr_resource_group
  location = var.acr_location
  tags     = var.tags
}

# Create azure container registry
resource "azurerm_container_registry" "acr" {
  name                          = var.acr_name
  location                      = var.acr_location
  resource_group_name           = azurerm_resource_group.acr_resource_group.name
  admin_enabled                 = true
  sku                           = var.acr_sku
  public_network_access_enabled = false
  tags                          = var.tags
}

# create a new resource group
resource "azurerm_resource_group" "pe_rg" {
  name     = var.private_endpoint_resource_group_name
  location = var.acr_location
}

# create acr private endpoint
resource "azurerm_private_dns_zone" "acr_private_dns_zone" {
  name                = var.private_dns_zone_name
  resource_group_name = azurerm_resource_group.pe_rg.name
}

# create azure private dns zone and virtual network link for acr private endpoint vnet
resource "azurerm_private_dns_zone_virtual_network_link" "acr_private_dns_zone_virtual_network_link" {
  name                  = var.private_endpoint_vnet_private_link_name
  private_dns_zone_name = azurerm_private_dns_zone.acr_private_dns_zone.name
  resource_group_name   = azurerm_resource_group.pe_rg.name
  virtual_network_id    = data.azurerm_virtual_network.acr_vnet.id
  registration_enabled  = true
  tags                  = var.tags
}

# Create azure private endpoint
resource "azurerm_private_endpoint" "acr_private_endpoint" {
  name                = var.private_endpoint_name
  resource_group_name = azurerm_resource_group.pe_rg.name
  location            = var.acr_location
  subnet_id           = data.azurerm_subnet.acr_subnet.id
  tags                = var.tags

  private_service_connection {
    name                           = var.private_endpoint_service_connection_name
    private_connection_resource_id = azurerm_container_registry.acr.id
    is_manual_connection           = false
    subresource_names = [
      "registry"
    ]
  }

  private_dns_zone_group {
    name = var.dns_zone_group
    private_dns_zone_ids = [
      azurerm_private_dns_zone.acr_private_dns_zone.id
    ]
  }
}
