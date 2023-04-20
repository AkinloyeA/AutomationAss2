# Resource for creating a log analytics workspace
resource "azurerm_log_analytics_workspace" "workspace" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.rgroup_name
  sku                 = var.log_analytics_workspace_sku
  tags                = local.common_tags
}

# Resource for creating a recovery services vault
resource "azurerm_recovery_services_vault" "az-vault" {
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.rgroup_name
  sku                 = "Standard"
  tags                = local.common_tags
}

# # Resource for creating a standard storage account with LRS redundancy
# resource "azurerm_storage_account" "az-storage" {
#   name                     = var.storage_account_name
#   resource_group_name      = var.rgroup_name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   tags                     = local.common_tags
# }
