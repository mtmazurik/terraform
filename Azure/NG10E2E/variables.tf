variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container Registry."
  type        = string

  default = "NG10E2E"
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string

  default = "WEST US 2"
}



variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map

  default = {
    source = "terraform",
    persistent = false
  }
}