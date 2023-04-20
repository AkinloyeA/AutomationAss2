resource "azurerm_postgresql_server" "database" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku_name                     = "B_Gen5_1"
  storage_mb                   = 5120
  version                      = 11
  ssl_enforcement_enabled      = true
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_postgresql_database" "database" {
  name                = var.db_name
  server_name         = azurerm_postgresql_server.database.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
  resource_group_name = var.resource_group_name
}