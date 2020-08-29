output "acr_id" {
  description = "The Container Registry ID."
  value       = "${element(split(",", join(",", azurerm_container_registry.registry.*.id) ), 0)}"
}

output "acr_login_server" {
  description = "The URL that can be used to log into the container registry."
  value       = "${element(split(",", join(",", azurerm_container_registry.registry.*.login_server) ), 0)}"
}

output "acr_admin_username" {
  description = "The Username associated with the Container Registry Admin account - if the admin account is enabled."
  value       = "${element(split(",", join(",", azurerm_container_registry.registry.*.admin_username)), 0)}"
}

output "acr_admin_password" {
  description = "The Password associated with the Container Registry Admin account - if the admin account is enabled."
  value       = "${element(split(",", join(",", azurerm_container_registry.registry.*.admin_password) ), 0)}"
}
output "vault_id" {
  value = "${azurerm_key_vault.vault.id}"
}

output "vault_name" {
  value = "${azurerm_key_vault.vault.name}"
}