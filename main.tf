# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "rg" {
  name     = var.rg_name
}
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}