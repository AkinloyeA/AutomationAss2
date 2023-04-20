variable "rgroup_name" {
  description = "The resource group name."
  type        = string
  default     = "n01525374-assignmemt1-RG"
}

variable "location" {
  description = "The location of the resource group."
  type        = string
}

locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "akinloye.aremu"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}
