# Resource for creating a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  address_space       = var.vnet_space
  location            = var.location
  resource_group_name = var.rgroup_name
  tags                = local.common_tags
}

# Resource for creating a subnet
resource "azurerm_subnet" "subnet_1" {
  name                 = var.network_subnet1
  address_prefixes     = var.subnet_space_1
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rgroup_name
}

resource "azurerm_subnet" "subnet_2" {
  name                 = var.network_subnet2
  address_prefixes     = var.subnet_space_2
  virtual_network_name = azurerm_virtual_network.vnet.name
  resource_group_name  = var.rgroup_name

}

resource "azurerm_network_security_group" "nsg_1" {
  name                = var.nsg1
  location            = var.location
  resource_group_name = var.rgroup_name

  security_rule {
    name                       = "allow_ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_security_group" "nsg_2" {
  name                = var.nsg2
  location            = var.location
  resource_group_name = var.rgroup_name

  security_rule {
    name                       = "allow_rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
