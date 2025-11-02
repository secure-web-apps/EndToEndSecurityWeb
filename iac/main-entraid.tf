locals {
  dev_redirect_uris    = ["https://localhost:5001/signin-oidc", "https://${replace(local.name_template, "<service>", "appsrv")}.azurewebsites.net/signin-oidc"]
  nondev_redirect_uris = var.custom_domain_name != "" ? ["https://${var.custom_domain_name}/signin-oidc", "https://${replace(local.name_template, "<service>", "appsrv")}.azurewebsites.net/signin-oidc"] : ["https://${replace(local.name_template, "<service>", "appsrv")}.azurewebsites.net/signin-oidc"]
}

resource "azuread_application" "aadapp" {
  display_name     = format("%s Application %s", var.resource_prefix, var.stage)
  identifier_uris  = []
  sign_in_audience = "AzureADMyOrg"
  logo_image       = filebase64("icon-192.png")
  web {
    redirect_uris = var.stage == "dev" ? local.dev_redirect_uris : local.nondev_redirect_uris
    logout_url    = var.custom_domain_name != "" ? "https://${var.custom_domain_name}/signout-callback-oidc" : "https://${replace(local.name_template, "<service>", "appsrv")}.azurewebsites.net/signout-callback-oidc"
  }
  api {
    requested_access_token_version = 2
  }
  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"
    resource_access {
      id   = "e1fe6dd8-ba31-4d61-89e7-88639da4683d" // User.Read
      type = "Scope"
    }
  }
}

resource "time_rotating" "example" {
  rotation_days = 7
}

resource "azuread_application_password" "aadapppwd" {
  display_name   = "apppwd"
  application_id = azuread_application.aadapp.id
  rotate_when_changed = {
    rotation = time_rotating.example.id
  }
}

resource "azuread_service_principal" "aadapp-sp" {
  client_id = azuread_application.aadapp.client_id
}
