
variable "windows_name" {
  type = map(string)
}

variable "vmwindows_id" {
  type = string
}

variable "vmlinux_id" {
  default = ""
}

variable "vmwindows_name" {
  default = ""
}

variable "vmlinux_name" {
  default = " "
}

variable "resource_group_name" {
  description = "Name of the resource group where the virtual machines are located"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "disk_size_gb" {
  description = "Size of each data disk in GB"
  type        = number
  default     = 10
}

# variable "subnet_id" {
#   description = "The ID of the subnet where the VMs will be placed."
#   type        = string
# }

locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "akinloye.aremu"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}
# variable "windows_name_input" {
#   type        = list(string)
#   description = "List of Windows virtual machine names"
#   default     = []
# }


# variable "windows_virtual_machine_ids" {
#   type = map(string)
# }

