# terraform/modules/vnet/variables.tf
variable "environment" { type = string }
variable "location" { type = string }
variable "resource_group" { type = string }
variable "vnet_cidr" { type = string }
variable "aks_subnet_cidr" { type = string }
