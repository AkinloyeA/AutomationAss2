output "resource_group_name" {
  value = module.rgroup.rgroup_name
}
output "vnet_name" {
  description = "Name of the virtual network."
  value       = module.network.vnet_name
}

output "subnet_name" {
  description = "Name of the subnet."
  value       = module.network.subnet_id
}

output "log_analytics_workspace_name" {
  description = "Name of the log analytics workspace."
  value       = module.common.workspace_name
}

output "recovery_services_vault_name" {
  description = "Name of the recovery services vault."
  value       = module.common.vault_name
}

# output "storage_account_name" {
#   description = "Name of the storage account."
#   value       = module.common.storage_account_name
# }

output "vm_hostnames" {
  value = module.vmlinux.vm_hostnames
}

output "vm_domain_names" {
  value = module.vmlinux.vm_domain_names
}

output "vm_private_ips" {
  value = module.vmlinux.vm_private_ips
}

output "vm_public_ip_address" {
  value = module.vmlinux.vm_public_ip_address
}

output "linux_domain_names" {
  value = module.vmlinux.vm_domain_names
}

output "windows_name" {
  value     = module.vmwindows.windows_name
  sensitive = true
}

output "windows_public_ip" {
  value = module.vmwindows.vm_public_ip_address
}

output "windows_private_ips" {
  value = module.vmwindows.vm_private_ip_address
}

output "database_name" {
  value = module.database.database_name
}