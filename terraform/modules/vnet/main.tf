# terraform/modules/vnet/main.tf
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-vnet"
  address_space       = [var.vnet_cidr]
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = "${var.environment}-aks-subnet"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.aks_subnet_cidr]
}

output "subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}
