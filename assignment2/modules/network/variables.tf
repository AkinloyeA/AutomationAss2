locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
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
  default = "Canada Central"
}

variable "vnet" {
  default = "network-vnet"
}

variable "vnet_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "network_subnet1" {
  default = "lab6-subnet1"
}

variable "network_subnet2" {
  default = "lab6-subnet2"
}

variable "subnet_space_1" {
  default = ["10.0.1.0/24"]
}

variable "subnet_space_2" {
  default = ["10.0.2.0/24"]
}

variable "nsg1" {
  default = "networkSecurityGroup1"
}

variable "nsg2" {
  default = "networkSecurityGroup2"
}