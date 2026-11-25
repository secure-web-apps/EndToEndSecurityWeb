terraform {
  required_version = "~> 1.17.2"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.10.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.15.0"
    }
  }
}
