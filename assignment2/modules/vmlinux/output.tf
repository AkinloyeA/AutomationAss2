output "vm_hostnames" {
  value = [azurerm_linux_virtual_machine.vm.*.public_ip_address]
}

output "vm_domain_names" {
  value = [azurerm_linux_virtual_machine.vm.*.public_ip_address]
}

output "vm_private_ips" {
  value = [azurerm_linux_virtual_machine.vm.*.private_ip_address]
}

output "vm_public_ip_address" {
  value = [azurerm_public_ip.vm-pip[*].ip_address]
}

output "linux_virtual_machine_ids" {
  value = [azurerm_linux_virtual_machine.vm[*].id]
}