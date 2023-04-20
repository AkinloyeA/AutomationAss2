variable "location" {
  description = "The location where the DB instance will be created."
}

variable "resource_group_name" {
  description = "The name of the resource group in which the DB instance will be created."
  default     = "n01525374-assignmemt1-RG"
}

variable "db_name" {
  description = "The name of the Azure DB for PostgreSQL instance."
}

variable "server_name" {
  description = "The name of the server for PostgreSQL instance."
}

variable "administrator_login" {
  description = "The administrator login name for the Azure DB for PostgreSQL instance."
}

variable "administrator_login_password" {
  description = "The administrator login password for the Azure DB for PostgreSQL instance."
}