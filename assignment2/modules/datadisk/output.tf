output "windows_data_disk" {
  value = azurerm_managed_disk.windows_datadisk
}

output "windows_data_disk_attach" {
  value = azurerm_virtual_machine_data_disk_attachment.win_datadisk_attachment
}

output "linux_data_disk" {
  value = [azurerm_managed_disk.linux_datadisk[*]]
}

output "linux_data_disk_attach" {
  value = [azurerm_virtual_machine_data_disk_attachment.linux_datadisk_attachment[*]]
}

