# Output values
output "workspace_id" {
  value = azurerm_log_analytics_workspace.workspace.id
}

output "workspace_name" {
  value = azurerm_log_analytics_workspace.workspace.name
}

output "vault_id" {
  value = azurerm_recovery_services_vault.az-vault.id
}

output "vault_name" {
  value = azurerm_recovery_services_vault.az-vault.name
}


