terraform {
  required_version = "~> 1.13.3"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.6.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.49.0"
    }
  }
}
