
# Windows VM Data Disk
resource "azurerm_managed_disk" "windows_datadisk" {
  name                 = "5374-win-data-disk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
}

# Windows Virtual Machine Data Disk Attachment
resource "azurerm_virtual_machine_data_disk_attachment" "win_datadisk_attachment" {
  managed_disk_id           = azurerm_managed_disk.windows_datadisk.id
  virtual_machine_id        = var.vmwindows_id
  lun                       = 0
  caching                   = "None"
  write_accelerator_enabled = false
}

# Linux Data Disks
resource "azurerm_managed_disk" "linux_datadisk" {
  for_each             = var.vmlinux_name
  name                 = "${each.key}-data-disk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.disk_size_gb
}
# Linux Virtual Machine Data Disk Attachment
resource "azurerm_virtual_machine_data_disk_attachment" "linux_datadisk_attachment" {
  for_each                  = var.vmlinux_name
  managed_disk_id           = azurerm_managed_disk.linux_datadisk[each.key].id
  virtual_machine_id        = element(var.vmlinux_id, 0)[0][each.value]
  lun                       = 0
  caching                   = "None"
  write_accelerator_enabled = false
  # depends_on           = [azurerm_managed_disk.linux_data_disk]
}

