terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.33.0"
    }
  }
}

provider "azurerm" {
  features {}
 subscription_id = "c4c16584-d421-4f39-b3eb-2ac7c4b45d20"
}
