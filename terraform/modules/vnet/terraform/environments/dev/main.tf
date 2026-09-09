# terraform/environments/dev/main.tf
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "enterprise-dev-rg"
  location = "East US"
}

module "network" {
  source          = "../../modules/vnet"
  environment     = "dev"
  location        = azurerm_resource_group.rg.location
  resource_group  = azurerm_resource_group.rg.name
  vnet_cidr       = "10.0.0.0/16"
  aks_subnet_cidr = "10.0.1.0/24"
}
