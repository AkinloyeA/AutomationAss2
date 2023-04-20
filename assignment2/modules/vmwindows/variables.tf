variable "location" {
  description = "The Azure region in which resources should be created."
}

variable "rgroup_name" {
  description = "The name of the resource group in which resources should be created."
}

variable "windowsvm_name" {
  type = string
}


variable "vm_size" {
  description = "The VM size."
  default     = "Standard_B1ms"
}

variable "admin_username" {
  description = "The admin username for the VM."
}

variable "admin_password" {
  description = "The admin password for the VM."
  default     = "P@ssw0rd1234"
}

variable "antimalware_extension_version" {
  description = "The version of the Antimalware extension."
  default     = "1.15"
}

variable "vm_extension" {
  type = map(map(string))
  default = {
    antimalware = {}
  }
}


variable "subnet_id" {
  description = "The ID of the subnet to which the NIC should be attached."
}

variable "availability_set_name" {
  description = "The name of the availability set."
}

variable "win_os_info" {
  type = map(any)
  default = {
    publisher            = "MicrosoftWindowsServer"
    offer                = "WindowsServer"
    sku                  = "2016-Datacenter"
    version              = "latest"
    storage_account_type = "StandardSSD_LRS"
    disk_size            = "128"
    caching              = "ReadWrite"
  }
}
variable "vm_os_publisher" {
  description = "The publisher of the VM OS."
  default     = "MicrosoftWindowsServer"
}

variable "vm_os_offer" {
  description = "The offer of the VM OS."
  default     = "WindowsServer"
}

variable "vm_os_sku" {
  description = "The SKU of the VM OS."
  default     = "2016-Datacenter"
}

variable "vm_os_version" {
  description = "The version of the VM OS."
  default     = "latest"
}

locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "akinloye.aremu"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}