provider "azurerm" {
  version = "=2.8.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rpatt"
    storage_account_name = "terraformrpatt"
    container_name       = "terraformconfig"
    key                  = "prod.terraform.tfstate"
  }
}

# Random Number Generator
resource "random_integer" "sa_num" {
  min = 00
  max = 10
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
#  name     = "${var.prefix}TerraformRG"
  name     = "rg-${var.subscriptiontype[0]}-${var.location}-001"
  location = var.location
  tags     = var.tags
}

/*
# Storage Account
resource "azurerm_storage_account" "storageacc" {
  name                     = "sa${lower(var.prefix)}${random_integer.sa_num.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags     = var.tags
}

# Create virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}Vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

# Create subnet
resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}Subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = ["10.0.1.0/24"]
}
*/