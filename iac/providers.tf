provider "azurerm" {
  environment     = "public"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  use_oidc        = true
  features {}
}

provider "azuread" {
  tenant_id = var.tenant_id
}

provider "azapi" {
  tenant_id = var.tenant_id
}
