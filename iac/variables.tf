variable "client_id" {
  type        = string
  description = "Entra app client id"
}
variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
  sensitive   = true
}
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
  sensitive   = true
}
variable "resource_prefix" {
  type        = string
  description = "Resource prefix to use for resource names"
}
variable "resource_prefix_short" {
  type        = string
  description = "Short resource prefix to use for resource names"
}
variable "default_location" {
  type        = string
  description = "Default Azure resource location"
}
variable "stage" {
  type        = string
  description = "Deployment stage"
  validation {
    condition     = contains(["prod", "int", "test", "dev"], var.stage)
    error_message = "Deployment stage must be one of 'prod', 'int', 'test', 'dev'."
  }
}
variable "app_worker_count" {
  type        = number
  description = "Number of App Instances/Workers"
}
variable "app_sku_name" {
  type        = string
  description = "App Plan SKU e.g F1, B1, S1, P1v2, I1v1, P1v3, I1v2, ..."
}
variable "custom_domain_name" {
  type        = string
  description = "Custom domain name for the App Service (e.g. api.domain.com). Leave empty to skip custom domain and SSL setup."
  default     = ""
}
