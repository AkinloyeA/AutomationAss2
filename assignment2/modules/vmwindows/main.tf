module "rgroup" {
  source   = "../rgroup"
  location = var.location
}

# Create the availability set
resource "azurerm_availability_set" "availability_set" {
  name                         = var.availability_set_name
  location                     = var.location
  resource_group_name          = module.rgroup.rgroup_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
}

# Create the Windows VM
resource "azurerm_windows_virtual_machine" "vmwindows" {
  name                  = "${var.windowsvm_name}-win"
  location              = var.location
  resource_group_name   = module.rgroup.rgroup_name
  size                  = "Standard_B1ms"
  admin_username        = "adminuser"
  admin_password        = "P@ssword1234!"
  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  os_disk {
    name                 = "osdisk-var.windows_name"
    storage_account_type = var.win_os_info.storage_account_type
    disk_size_gb         = var.win_os_info.disk_size
    caching              = var.win_os_info.caching

  }
  source_image_reference {
    publisher = var.win_os_info.publisher
    offer     = var.win_os_info.offer
    sku       = var.win_os_info.sku
    version   = var.win_os_info.version
  }
}
# Install the Antimalware extension
resource "azurerm_virtual_machine_extension" "extension" {
  name                 = "IaaSAntimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.vmwindows.id
  publisher            = "Microsoft.Azure.Security.AntimalwareSignature"
  type                 = "AntimalwareConfiguration"
  type_handler_version = "2.58"
  settings             = <<SETTINGS
    {
      "AntimalwareEnabled": true,
      "RealtimeProtectionEnabled": true,
      "ScheduledScanSettings": {
        "isEnabled": true,
        "day": "Sunday",
        "time": "120",
        "scanType": "Quick"
      },
      "ExclusionsExtensions": "",
      "ExclusionsPaths": "",
      "ExclusionsProcesses": "",
      "ScanParameter": "/Z"
    }
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
    {
      
    }
PROTECTED_SETTINGS
}


# Create a network interface for the VM
resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.windowsvm_name}-nic"
  location            = var.location
  resource_group_name = var.rgroup_name
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.windowsvm_name}-ip-config"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_windows.id
  }
}

resource "azurerm_public_ip" "pip_windows" {
  name                = "${var.windowsvm_name}-pip"
  resource_group_name = module.rgroup.rgroup_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = local.common_tags
}
