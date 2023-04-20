module "rgroup" {
  source   = "../rgroup"
  location = var.location
}

# Create the availability set
resource "azurerm_availability_set" "availability_set" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.rgroup_name
}

# Create the VMs
resource "azurerm_linux_virtual_machine" "vm" {
  count               = var.vm_count
  name                = "${var.linux_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.rgroup_name
  tags                = local.common_tags
  size                = "Standard_B1ms"
  admin_username      = var.admin_username
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }
  network_interface_ids = [azurerm_network_interface.vm_nic[count.index].id]

  os_disk {
    name                 = "${var.linux_name}-os-disk-${count.index + 1}"
    caching              = var.os_disk_attributes.caching
    storage_account_type = var.os_disk_attributes.storage_account_type
  }

  source_image_reference {
    publisher = var.linux_os_information.publisher
    offer     = var.linux_os_information.offer
    sku       = var.linux_os_information.sku
    version   = var.linux_os_information.version
  }
}

# Create a network interface for each VM
resource "azurerm_network_interface" "vm_nic" {
  count               = var.vm_count
  name                = "${var.linux_name}-${count.index}-nic"
  location            = var.location
  tags                = local.common_tags
  resource_group_name = module.rgroup.rgroup_name

  ip_configuration {
    name                          = "${var.linux_name}-ipconfig1-${count.index + 1}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm-pip[count.index].id
  }
}

# Create public IP addresses for the VMs
resource "azurerm_public_ip" "vm-pip" {
  count               = var.vm_count
  name                = "${var.linux_name}-${count.index}-pip"
  location            = var.location
  resource_group_name = module.rgroup.rgroup_name
  tags                = local.common_tags
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.dns_label_prefix}-${count.index}"
}
