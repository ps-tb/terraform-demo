provider "azurerm" {
  version = "~>1.41.0"
}

data "azurerm_subscription" "subscription" {}

resource "azurerm_resource_group" "rg" {
  name     = "demo-dev-crisp-rg"
  location = var.default_location
}

resource "azurerm_key_vault" "keyvault" {
  name                        = "demo-kv-dev-crisp"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_subscription.subscription.tenant_id
  sku_name                    = "Standard"
  tags                        = var.common_tags
}
