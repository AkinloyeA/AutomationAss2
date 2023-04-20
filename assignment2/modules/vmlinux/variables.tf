locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "akinloye.aremu"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

variable "admin_username" {
  description = "The Admin Username"
}

variable "public_key" {
  description = "The public key"
}

variable "private_key" {
  description = "The private key"
}
variable "os_disk_attributes" {
  type = map(any)
  default = {
    storage_account_type = "Premium_LRS"
    disk_size            = 32
    caching              = "ReadWrite"
  }
}

variable "linux_os_information" {
  type = map(any)
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}

variable "size" {
  description = "The size of the Linux VMs."
  type        = string
}

variable "rgroup_name" {
  description = "Name of the resource group where the VMs and supporting resources will be created"
}

variable "location" {
  description = "Azure region where the resources will be created"
  default     = "Canada Central"
}

variable "vm_count" {
  description = "Number of VMs to create"
  default     = 2
}

variable "linux_name" {
  description = "Prefix for the VM names"
  default     = "centos-vm"
}

variable "dns_label_prefix" {
  description = "Prefix for the DNS labels"
  default     = "centos-vm"
}
variable "availability_set_name" {
  description = "Name of the availability set to create for the VMs"
}

variable "nw_extension_version" {
  description = "Version of the Network Watcher extension to install on the VMs"
  default     = "1.4"
}
variable "subnet_id" {
  type = string
}
