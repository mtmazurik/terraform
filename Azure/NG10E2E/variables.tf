variable "acr_name" {
  description = "Specifies the name of the Container Registry. Changing this forces a new resource to be created."
  type        = string

    default = "NG10E2E"
}

variable "acr_resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."
  type        = string

  default = "NG10E2E"
}

variable "acr_location" {
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string

  default = "WEST US 2"
}

variable "acr_admin_enabled" {
  description = "Specifies whether the admin user is enabled."
  type        = string

  default = true
}

variable "acr_sku" {
  description = "The SKU name of the the container registry. Possible values are Classic, Basic, Standard and Premium."
  type        = string

  default = "Basic"
}

variable "acr_storage_account_id" {
  description = "The ID of a Storage Account which must be located in the same Azure Region as the Container Registry (Required for Classic Sku - Optional otherwise)."
  default     = ""
}

variable "acr_georeplication_locations" {
  description = "A list of Azure locations where the container registry should be geo-replicated."
  type        = list

  default = []
}

variable "acr_tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map

  default = {
    source = "terraform"
  }
}