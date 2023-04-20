resource "azurerm_lb" "loadbalancer" {
  name                = "loadbalancer"
  location            = var.location
  resource_group_name = var.rgroup_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_lb_backend_address_pool" "linux_backend_pool" {
  name            = "backend-pool"
  loadbalancer_id = azurerm_lb.loadbalancer.id
}

resource "azurerm_public_ip" "publicip" {
  name                = "publicip"
  location            = var.location
  resource_group_name = var.rgroup_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label = "loadbalancer"
}

resource "azurerm_lb_nat_rule" "http" {
  name                           = "http"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  resource_group_name            = var.rgroup_name
  loadbalancer_id                = azurerm_lb.loadbalancer.id
}

resource "azurerm_lb_probe" "http" {
  name                = "http"
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 15
  number_of_probes    = 2
  loadbalancer_id     = azurerm_lb.loadbalancer.id
}