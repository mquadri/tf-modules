variable "example_group_name" {
  description = "Display name of an existing Azure AD group for the example."
  type        = string
  default     = "gcp-eas-test-group" # Replace with a valid group name in your test environment
}

variable "example_app_role_id" {
  description = "App Role ID to assign. Uses module default if not specified."
  type        = string
  default     = null # Will use module's default: "9e79c739-f165-49e8-8745-fe08f1634b3b"
}

variable "example_sso_sp_name" {
  description = "Display name of the GCP SSO Service Principal. Uses module default if not specified."
  type        = string
  default     = null # Will use module's default: "Google Cloud (GCP Lumen SSO)"
}

variable "example_prov_sp_name" {
  description = "Display name of the GCP Provisioning Service Principal. Uses module default if not specified."
  type        = string
  default     = null # Will use module's default: "Google Cloud (GCP Lumen Provisioning)"
}
