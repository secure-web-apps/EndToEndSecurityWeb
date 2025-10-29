data "azurerm_client_config" "current" {}

data "azuread_domains" "aad_domains" {
  only_initial = true
}

locals {
  name_template       = "${var.resource_prefix}-<service>-${var.stage}"
  name_template_short = "${var.resource_prefix_short}<service>${var.stage}"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = replace(local.name_template, "<service>", "rg")
  location = var.default_location
}

resource "azuread_group" "group-rg-contributor" {
  display_name            = format("%s-contributor", azurerm_resource_group.rg.name)
  description             = "Entra ID group which grants contributor access to the resource group"
  prevent_duplicate_names = true
  security_enabled        = true
  members                 = [data.azurerm_client_config.current.object_id]
  lifecycle {
    # apart from setting initially; do not flag changes in members and owners as state change
    ignore_changes = [members, owners]
  }
}

resource "azurerm_role_assignment" "rg-contributor" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.group-rg-contributor.object_id
}

output "rg_name" {
  value = azurerm_resource_group.rg.name
}
