# Azure App Service Plan and App Service
resource "azurerm_service_plan" "appplan" {
  name                = replace(local.name_template, "<service>", "applan")
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.default_location
  os_type             = "Linux"
  sku_name            = var.app_sku_name
  worker_count        = var.app_worker_count
}

resource "azurerm_linux_web_app" "appsrv" {
  name                = replace(local.name_template, "<service>", "appsrv")
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.default_location
  service_plan_id     = azurerm_service_plan.appplan.id
  https_only          = true
  site_config {
    application_stack {
      dotnet_version = "9.0"
    }
    http2_enabled = true
    always_on     = false
  }
  identity {
    type = "SystemAssigned"
  }
  app_settings = merge(
    {
      "WEBSITE_RUN_FROM_PACKAGE" = "1"
    }
  )
  lifecycle {
    ignore_changes = [
      site_config["application_stack"]
    ]
  }
}

# Azure App Service custom domain and SSL certificate

## Azure DNS CNAME entry for custom domain
# resource "azurerm_dns_txt_record" "domain-verification" {
#   name                = "asuid.api.domain.com"
#   zone_name           = var.azure_dns_zone
#   resource_group_name = var.azure_resource_group_name
#   ttl                 = 300
#   record {
#     value = azurerm_linux_web_app.appsrv.custom_domain_verification_id
#   }
# }

# resource "azurerm_dns_cname_record" "cname-record" {
#   name                = "domain.com"
#   zone_name           = azurerm_dns_zone.dns-zone.name
#   resource_group_name = var.azure_resource_group_name
#   ttl                 = 300
#   record              = azurerm_linux_web_app.appsrv.default_hostname
#   depends_on = [azurerm_dns_txt_record.domain-verification]
# }

resource "azurerm_app_service_custom_hostname_binding" "appsrv-hostname-binding" {
  count               = var.custom_domain_name != "" ? 1 : 0
  hostname            = var.custom_domain_name
  app_service_name    = azurerm_linux_web_app.appsrv.name
  resource_group_name = azurerm_resource_group.rg.name
  // depends_on = [azurerm_dns_cname_record.cname-record]

  # Ignore ssl_state and thumbprint as they are managed using
  # azurerm_app_service_certificate_binding.example
  lifecycle {
    ignore_changes = [ssl_state, thumbprint]
  }
}

resource "azurerm_app_service_managed_certificate" "appsrv_cert" {
  count                      = var.custom_domain_name != "" ? 1 : 0
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.appsrv-hostname-binding.0.id
}

resource "azurerm_app_service_certificate_binding" "appsrv_cert_bind" {
  count               = var.custom_domain_name != "" ? 1 : 0
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.appsrv-hostname-binding.0.id
  certificate_id      = azurerm_app_service_managed_certificate.appsrv_cert.0.id
  ssl_state           = "SniEnabled"
}
