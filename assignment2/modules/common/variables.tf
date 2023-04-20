locals {
  common_tags = {
    Project        = "Automation Project – Assignment 2"
    Name           = "akinloye.aremu"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

variable "rgroup_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resources"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of the log analytics workspace"
  default     = "PerGB2018"
}

variable "recovery_services_vault_name" {
  type        = string
  description = "Name of the recovery services vault"
}

variable "log_analytics_workspace_sku" {
  description = "The SKU of the Log Analytics Workspace"
  type        = string
}

