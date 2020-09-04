terraform {}

provider "azurerm" {
  version = ">= 2.0"  # auto reads: ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, etc. from env vars
}

data "azurerm_subscription" "current" {    
}									

# create Resource Group 
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name  # persistent
  location = var.location         # west us 2
}
# create Azure Container Registry ("registrycca")
resource "azurerm_container_registry" "registry" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_enabled       = var.acr_admin_enabled
  sku                 = var.acr_sku
  storage_account_id  = var.acr_storage_account_id
  tags                = var.tags
}

# create Azure Key Vault ("vaultcca")
resource "azurerm_key_vault" "vault" {
  name                = var.vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name = "standard"
  tenant_id           = var.tenant_id
}

