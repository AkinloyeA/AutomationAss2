module "rgroup" {
  source      = "./modules/rgroup"
  rgroup_name = "n01525374-assignmemt2-RG"
  location    = "Canada Central"
}

module "network" {
  source          = "./modules/network"
  rgroup_name     = module.rgroup.rgroup_name
  vnet            = "vnet-lab"
  vnet_space      = ["10.0.0.0/16"]
  network_subnet1 = "subnet1_name"
  network_subnet2 = "subnet2_name"
  subnet_space_1  = ["10.0.1.0/24"]
  subnet_space_2  = ["10.0.2.0/24"]
  nsg1            = "nsg1"
  nsg2            = "nsg2"
  location        = "Canada Central"
}

module "common" {
  source                       = "./modules/common"
  rgroup_name                  = module.rgroup.rgroup_name
  location                     = "Canada Central"
  recovery_services_vault_name = "az-vault"
  log_analytics_workspace_sku  = "PerGB2018"
}

module "vmlinux" {
  source                = "./modules/vmlinux"
  vm_count              = 2
  linux_name            = "5374-u-vm"
  availability_set_name = "linux-avs"
  admin_username        = "Akinloye-N01525374"
  size                  = "Standard_B1ms"
  public_key            = "~/.ssh/id_rsa.pub"
  private_key           = "~/.ssh/id_rsa"
  location              = "Canada Central"
  rgroup_name           = module.rgroup.rgroup_name
  subnet_id             = module.network.subnet_id
}

module "vmwindows" {
  source                = "./modules/vmwindows"
  availability_set_name = "windows_avs"
  location              = "Canada Central"
  windowsvm_name        = "5374-w-vm1"
  rgroup_name           = module.rgroup.rgroup_name
  subnet_id             = module.network.subnet_id
  admin_username        = "Akinloye-N01525374"

}

module "datadisk" {
  source              = "./modules/datadisk"
  resource_group_name = module.rgroup.rgroup_name
  location            = "Canada Central"
  windows_name        = { "vm1" = module.vmwindows.windows_hostname }
  vmlinux_name = {
    "5374-vm-1" = 0
    "5374-vm-2" = 1
  }
  # subnet_id                     = module.network.subnet_id
  vmwindows_id = module.vmwindows.windows_name.id
  vmlinux_id   = [module.vmlinux.linux_virtual_machine_ids]
  depends_on   = [module.vmwindows]

}

module "loadbalancer" {
  source      = "./modules/loadbalancer"
  location    = "Canada Central"
  rgroup_name = module.rgroup.rgroup_name
}


module "database" {
  source                       = "./modules/database"
  location                     = "Canada Central"
  resource_group_name          = module.rgroup.rgroup_name
  db_name                      = "psqldatabase"
  administrator_login          = "psqldmin"
  administrator_login_password = "Pa$$w0rd123"
  server_name                  = "psqldbserver"
}
