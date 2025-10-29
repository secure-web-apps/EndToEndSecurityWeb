variable "tenant_id" {
  type        = string
  description = "Azure tenant ID"
}
variable "subscription_id" {
  type        = string
  description = "Azure subscription ID"
}
variable "resource_prefix" {
  type        = string
  description = "Prefix for all resources"
}
variable "default_location" {
  type        = string
  description = "Default Azure resource location"
}
