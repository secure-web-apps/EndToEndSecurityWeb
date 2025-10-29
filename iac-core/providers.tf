provider "azurerm" {
  environment         = "public"
  subscription_id     = var.subscription_id
  tenant_id           = var.tenant_id
  storage_use_azuread = true
  features {}
}

provider "azuread" {
  tenant_id = var.tenant_id
}
