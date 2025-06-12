variable "group_name" {
  description = "Name of the Azure AD group to assign roles to. This group must already exist."
  type        = string
  validation {
    condition     = length(var.group_name) > 0
    error_message = "The group_name must not be empty."
  }
}

variable "app_role_id_for_association" {
  description = "The App Role ID (usually from an Enterprise Application's manifest) to assign to the AAD group for the GCP service principals. This is typically a user role like 'User' or a specific custom role ID."
  type        = string
  default     = "9e79c739-f165-49e8-8745-fe08f1634b3b" # Defaulting to the previously hardcoded value.
}

variable "gcp_sso_service_principal_display_name" {
  description = "The display name of the GCP SSO Azure AD Service Principal."
  type        = string
  default     = "Google Cloud (GCP Lumen SSO)"
}

variable "gcp_prov_service_principal_display_name" {
  description = "The display name of the GCP Provisioning Azure AD Service Principal."
  type        = string
  default     = "Google Cloud (GCP Lumen Provisioning)"
}
