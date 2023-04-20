output "vm_private_ip_address" {
  value = azurerm_windows_virtual_machine.vmwindows.private_ip_address
}

output "vm_public_ip_address" {
  value = azurerm_public_ip.pip_windows.ip_address
}
output "windows_hostname" {
  value = azurerm_windows_virtual_machine.vmwindows.name
}

output "windows_name" {
  value = azurerm_windows_virtual_machine.vmwindows
}
# output "Windows_vm" {
#   value = azurerm_windows_virtual_machine.windows-vm
# }
# # output "windows_virtual_machine_ids" {
#   value = [for vm in azurerm_windows_virtual_machine.vmwindows : vm.id]
# }

