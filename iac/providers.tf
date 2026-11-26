provider "azurerm" {
  environment                    = "public"
  subscription_id                = var.subscription_id
  tenant_id                      = var.tenant_id
  use_oidc                       = true
  resource_providers_to_register = [
    "Microsoft.Compute",
    "Microsoft.Network",
    "Microsoft.Storage",
    "Microsoft.ManagedIdentity",
    "Microsoft.Web"
  ]
  features {}
}

provider "azuread" {
  tenant_id = var.tenant_id
}

provider "azapi" {
  tenant_id = var.tenant_id
}
