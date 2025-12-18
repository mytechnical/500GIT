terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.49.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-dhondu"
  #   storage_account_name = "tfstatesdhondhuwala"
  #   container_name       = "tfstates"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "a785593a-c8b3-44d5-823e-a59283374405"
}
