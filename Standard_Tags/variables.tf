# Naming and Tags ##
variable "location" {
  description = "The Azure region where resources will be deployed. This is used for the 'costRegion' tag."
  type        = string
  default     = ""
}

variable "resourcetype" {
  description = "The resource type being deployed (e.g., rg, vm, sql). Used for tagging purposes."
  type        = string
  default     = ""
}

variable "appid" {
  description = "The application ID. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "appname" {
  description = "The application name. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment code (e.g., dev, test, prod, sand, uat, dr). Used for tagging and naming purposes."
  type        = string
  default     = ""
  validation {
    condition     = var.env == "" ? true : contains(["dev", "test", "prod", "sand", "uat", "dr", "qa", "stage", "nonprod", "prod-dr"], lower(var.env))
    error_message = "The env must be one of the allowed values: dev, test, prod, sand, uat, dr, qa, stage, nonprod, prod-dr (case-insensitive)."
  }
}

variable "costCostCenter" {
  description = "The cost center code. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costVP" {
  description = "The VP responsible for the cost. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costAppOwnerTech" {
  description = "The technical application owner. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costAppOwnerManager" {
  description = "The application owner manager. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costBudgetOwner" {
  description = "The budget owner. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "additionalcontext" {
  description = "Additional context for naming (e.g., 01, 02, web, app)."
  type        = string
  default     = ""
}

variable "costDivision" {
  description = "The business division. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costAllocation" {
  description = "Cost allocation method. Must be either 'sharedcosts' or 'chargeback'."
  type        = string
  validation {
    condition     = contains(["sharedcosts", "chargeback"], var.costAllocation)
    error_message = "The costAllocation must be either 'sharedcosts' or 'chargeback'."
  }
}

variable "appFunction" {
  description = "The function of the application or resource. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "monthlyBudget" {
  description = "The monthly budget allocated. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costbaseline" {
  description = "The year the resource or cost baseline was created. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "mal_id" {
  description = "The MAL ID for tagging purposes. This is a mandatory tag for Lumen resources."
  type        = string
  # No default, making it required.
}
