variable "group_owners" {
  description = "List of owner User Principal Names (UPNs) or Object IDs for the group. These users must exist in Azure AD."
  type        = list(string)
  validation {
    condition     = length(var.group_owners) > 0
    error_message = "The group_owners list must not be empty."
  }
}

variable "group_name" {
  description = "The display name of the Azure AD group to create."
  type        = string
  validation {
    condition     = length(var.group_name) > 3
    error_message = "The group_name must be at least 4 characters in length."
  }
}

# Standard Lumen Tags (these will be applied to the resources if the module supports tagging)
# However, azuread_group resource itself does not support tags. These are included for consistency if this module were to create taggable resources.
# For now, they are not directly used but are good practice to include for future-proofing or if the module scope expands.

variable "app_id" {
  description = "Application ID, typically used for tagging."
  type        = string
  default     = null # Defaulting to null as AAD groups don't have Azure tags.
}

variable "environment" {
  description = "Environment (e.g., dev, test, prod). Typically used for tagging."
  type        = string
  default     = null # Defaulting to null as AAD groups don't have Azure tags.
  validation {
    condition     = var.environment == null ? true : contains(["dev", "test", "prod", "sand", "uat", "dr", "qa", "stage", "nonprod", "prod-dr"], lower(var.environment))
    error_message = "If provided, the environment must be one of the allowed values: dev, test, prod, sand, uat, dr, qa, stage, nonprod, prod-dr (case-insensitive)."
  }
}

variable "mal_id" {
  description = "MAL ID, typically used for tagging."
  type        = string
  default     = null # Defaulting to null as AAD groups don't have Azure tags.
}
