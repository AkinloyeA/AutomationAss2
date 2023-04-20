variable "location" {
  type        = string
  description = "The location where the resources will be created."
}

variable "rgroup_name" {
  type        = string
  description = "The name of the resource group where the resources will be created."
}

locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "akinloye.aremu"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}
