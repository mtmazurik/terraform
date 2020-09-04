terraform {}

provider "azurerm" {
  version = ">= 2.0"

  use_msi = true
}

data "azurerm_subscription" "current" {    
}									

data "azurerm_role_definition" "contributor" {
  name = "Contributor"
}

resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "registry" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_enabled       = var.acr_admin_enabled
  sku                 = var.acr_sku
  storage_account_id  = var.acr_storage_account_id
  tags                = var.tags
  identity			  {
	type = "SystemAssigned"
  }
}
resource "azurerm_role_assignment" "assignmentRegistry" {
	name				= azurerm_resource_group.rg.name
	scope				= azurerm_resource_group.rg.id						// resource-group scoped, can also scope Subscription-wide contributor role with:      = data.azurerm_subscription.primary.id
	role_definition_id	= "${data.azurerm_subscription.subscription.id}${data.azurerm_role_definition.contributor.id}"

	principle_id		= azurerm_container_registry.registry.identity[0]["principal_id"]
}

resource "azurerm_key_vault" "vault" {
  name                = var.vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name = "standard"
  tenant_id           = var.tenant_id
  identity			  {
	type = "SystemAssigned"
  }
}
resource "azurerm_role_assignment" "assignmentRegistry" {
	name				= azurerm_resource_group.rg.name
	scope				= azurerm_resource_group.rg.id						// resource-group scoped
	role_definition_id	= "${data.azurerm_subscription.subscription.id}${data.azurerm_role_definition.contributor.id}"

	principle_id		= azurerm_key_vault.vault.identity[0]["principal_id"]
}
