variable "example_group_name" {
  description = "Display name for the example Azure AD group."
  type        = string
  default     = "example-lumen-aad-group"
}

variable "example_group_owners" {
  description = "List of User Principal Names (UPNs) or Object IDs for the owners of the example group."
  type        = list(string)
  // Provide actual UPNs or Object IDs from your test Azure AD tenant
  // default     = ["user1@example.com", "00000000-0000-0000-0000-000000000000"]
  // For safety in a generic example, leave this to be set by the user.
  // Ensure these users exist in the Azure AD where this example is run.
}

variable "example_app_id" {
  description = "Example Application ID for consistent module variable structure."
  type        = string
  default     = "APP000"
}

variable "example_environment" {
  description = "Example Environment for consistent module variable structure."
  type        = string
  default     = "dev"
}

variable "example_mal_id" {
  description = "Example MAL ID for consistent module variable structure."
  type        = string
  default     = "MAL000000"
}
