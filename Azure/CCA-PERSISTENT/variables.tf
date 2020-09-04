
variable "location" {
  description   = "Azure location for the provisioned resources."
  type          = string

  default       = "WEST US 2"
}

variable "resource_group_name" {
  description   = "Name of the resource group."
  type          = string

  default       = "persistent"
}

variable "tags" {
  description   = "Tags (key-value pairs) assigned to the resource."
  type          = map

  default = {
    source      = "terraform",
    persist     = true
  }
}

variable "acr_name" {
  description   = "Name of the Container Registry."
  type          = string

  default   = "registrycca"
}

variable "acr_sku" {
  description   = "SKU name of the the container registry. Possible values are Classic, Basic, Standard and Premium."
  type          = string

  default       = "Basic"
}


variable "acr_admin_enabled" {
  description   = "Enable admin user."
  type          = string

  default = true
}

variable "acr_storage_account_id" {
  description   = "The ID of a Storage Account which must be located in the same Azure Region as the Container Registry (Required for Classic Sku - Optional otherwise)."
  default       = ""
}

variable "vault_name" {
  description = "Name of the Azure Key Vault."
  type        = string

  default = "vaultcca"
}
