output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  value = azurerm_subnet.subnet_1.id
}
output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}
output "subnet1_address_prefixes" {
  value = azurerm_subnet.subnet_1.address_prefixes
}
output "subnet2_address_prefixes" {
  value = azurerm_subnet.subnet_2.address_prefixes
}

output "nsg1_name" {
  value = azurerm_network_security_group.nsg_1.name
}

output "nsg2_name" {
  value = azurerm_network_security_group.nsg_2.name
}
