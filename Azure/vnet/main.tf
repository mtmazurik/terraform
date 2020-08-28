#############################################################################
# VARIABLES
#############################################################################

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "subnet_names" {
  type    = list(string)
  default = ["subnet1", "subnet2"]
}

#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  features {}
}

#############################################################################
# RESOURCES
#############################################################################
resource "azurerm_resource_group" "example" {
  name = "my-resources"
  location = "West US 2"
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.0.0/24", "10.0.1.0/24"]
  subnet_names        = ["subnet1", "subnet2"]

  tags = {
    environment = "dev"
    costcenter  = "it"

  }
}

#############################################################################
# OUTPUTS
#############################################################################

output "vnet_id" {
  value = module.vnet.vnet_id
}
