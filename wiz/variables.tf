variable "azure_environment" {
  type        = string
  default     = "public"
  description = <<EOF
    The Cloud Environment which should be used, possible values are: public, usgovernment, german, and china.
    Defaults to public. 
  EOF
}

variable "azure_management_group_id" {
  type        = string
  default     = ""
  description = <<EOF
    If set, will add role assignments for the wiz application to the management group.
    Takes precedence over subscription_id.
  EOF
}

variable "azure_subscription_id" {
  type        = string
  default     = ""
  description = <<EOF
    If set, will add role assignments for the wiz application to the subscription.
    If management_group_id is set, it takes precedence.
  EOF
}

variable "wiz_custom_role_name" {
  type        = string
  default     = "WizCustomRole"
  description = "The name of the Azure custom role to create. Defaults to WizCustomRole."
}

variable "enable_entra_id_scanning" {
  type        = bool
  default     = false
  description = "If set, adds permissions for Entra ID scanning to the Azure Service Principal. Default is false."
}

variable "enable_data_scanning" {
  type        = bool
  default     = false
  description = "If set, adds data scanning required permissions to the Wiz custom role. Default is false."
}

variable "enable_serverless_scanning" {
  type        = bool
  default     = false
  description = "If set, adds serverless scanning required permissions to the Wiz custom role. Default is false."
}

variable "enable_openai_scanning" {
  type        = bool
  default     = false
  description = "If set, adds the required role for OpenAI scanning by Wiz. Default is false."
}

variable "azure_wait_timer" {
  type        = string
  description = "(Optional) Wait timer for Azure dataplane propagation - Default: 360"
  default     = "360s"
}

variable "wiz_spn_id" {
  type        = string
  description = "Object ID of Wiz's SPN managed Entra ID application."
}
