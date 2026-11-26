terraform {
  required_version = "~> 1.17.2"
  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~> 2.14.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.10.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.15.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.9.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.3.2"
    }
  }
}
