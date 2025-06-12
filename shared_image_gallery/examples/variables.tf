variable "shared_image_gallery_config" {
  description = "Configuration for the azurerm_shared_image_gallery resource."
  type = map(object({
    # Required parameters
    name                = string
    resource_group_name = string
    location            = string

    # Optional parameters
    description = optional(string)
    sharing = optional(object({
      permission = string
      community_gallery = optional(object({
        eula            = string
        prefix          = string
        publisher_email = string
        publisher_uri   = string
      }), null)
    }), null)
    tags = optional(map(string), {})
  }))
}

# tags
variable "app_id" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "environment" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string

  validation {
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX", "NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}