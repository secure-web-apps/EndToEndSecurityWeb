data "azurerm_client_config" "current" {}

locals {
  name_template = "${var.resource_prefix}-<service>-iac"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = replace(local.name_template, "<service>", "rg")
  location = var.default_location
}

resource "azuread_group" "group-rg-contributor" {
  display_name            = format("%s-contributor", azurerm_resource_group.rg.name)
  prevent_duplicate_names = true
  security_enabled        = true
  members                 = [data.azurerm_client_config.current.object_id]
  lifecycle {
    # apart from setting initially; do not flag changes in members and owners as state change
    ignore_changes = [members, owners]
  }
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  resource_group_name             = azurerm_resource_group.rg.name
  name                            = format("%s01", "storiac")
  location                        = var.default_location
  account_tier                    = "Standard"
  account_replication_type        = "GRS"
  shared_access_key_enabled       = false
  default_to_oauth_authentication = true
  min_tls_version                 = "TLS1_2"
}

# container iac-state
resource "azurerm_storage_container" "tfstate" {
  name               = "tfstate"
  storage_account_id = azurerm_storage_account.sa.id
}

resource "azurerm_role_assignment" "blob-data-owner" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azuread_group.group-rg-contributor.object_id
}

resource "azurerm_role_assignment" "rg-contributor" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.group-rg-contributor.object_id
}
