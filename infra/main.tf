terraform {
  backend "azurerm" {
    resource_group_name   = "camilo-devops-training"
    storage_account_name  = "camilosa202105250043"
    container_name        = "terraform"
    key                   = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.61.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "devopssa" {
  name = "camilo-devops-training"
}

resource "azurerm_storage_account" "example" {
  name                     = "camilosademo2021281258"
  resource_group_name      = data.azurerm_resource_group.devopssa.name
  location                 = data.azurerm_resource_group.devopssa.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}
