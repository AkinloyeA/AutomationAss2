
resource "azurerm_resource_group" "rgroup" {
  name     = var.rgroup_name
  location = var.location
  tags     = local.common_tags
}
