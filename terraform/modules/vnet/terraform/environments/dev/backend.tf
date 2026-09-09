# terraform/environments/dev/backend.tf
terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-rg"
    storage_account_name = "enterprisetfstatestore"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
