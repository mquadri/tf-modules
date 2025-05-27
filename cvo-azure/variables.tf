#Keyvault variables

variable "keyvault_name" {
  type        = string
  description = "Name of the keyavult to store the private key"
}

variable "keyvault_rg" {
  type        = string
  description = "Keyvault RG name"
}

variable "secret_name_refresh_token" {
  description = "key vault secret name for refresh token of NetApp cloud manager. This can be generated from netapp Cloud Central."
  type        = string
}

variable "secret_subscription_id" {
  description = "subscription ID"
  type        = string
}

variable "secret_name_svm" {
  description = "keyvault secret name for The admin password for Cloud Volumes ONTAP."
  type        = string
}

variable "secret_name_client" {
  description = "The refresh token of NetApp cloud manager. This can be generated from netapp Cloud Central."
  type        = string

}

variable "secret_name_workspace" {
  description = "keyvault secret name for ID of the Cloud Manager workspace where you want to deploy Cloud Volumes ONTAP. If not provided, Cloud Manager uses the first workspace. You can find the ID from the Workspace."
  type        = string
}

variable "secret_name_nss" {
  description = "secret name for keyvault for The NetApp Support Site account ID to use with this Cloud Volumes ONTAP system. If the license type is BYOL and an NSS account isn't provided, Cloud Manager tries to use the first existing NSS account."
  type        = string
}

variable "secret_name_saas" {
  description = "keyvault secret name for The ID of the SaaS NetApp to Azure subscription."
  type        = string
}

variable "cvo_instances" {
  description = "Map of CVO instances to deploy"
  type = map(object({
    cvo_name             = string
    location             = string
    subnet_id            = string
    vnet_id              = string
    vnet_resource_group  = string
    data_encryption_type = string
    storage_type         = string
    capacity_tier        = string
    tier_level           = string
    writing_speed_state  = string
    is_ha                = bool
    ontap_version        = string
    instance_type        = string
    license_type         = string
  }))
}