variable "data_items" {
  type        = any
  description = "The data items to include in the workbook"
  default     = []
}
variable "data_json_version" {
  type        = string
  default     = ""
  description = "The version of the data json"
}
variable "resource_group_name" {
  description = "The name of the resource group to deploy workbooks"
  type        = string
  default     = ""
}
variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource"
}
variable "workbook_name" {
  description = "The name of the workbook"
  type        = string
  default     = ""
}
variable "appname" {
  description = "The name of the application"
  type        = string
  default     = ""
}
variable "appid" {
  description = "The application ID"
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment for the application"
  type        = string
  default     = ""
}

variable "resourcetype" {
  description = "The type of the resource"
  type        = string
  default     = ""
}

variable "costAppOwnerManager" {
  description = "The cost app owner manager"
  type        = string
  default     = ""
}

variable "costAppOwnerTech" {
  description = "The cost app owner tech"
  type        = string
  default     = ""
}

variable "costBudgetOwner" {
  description = "The cost budget owner"
  type        = string
  default     = ""
}

variable "costCostCenter" {
  description = "The cost cost center"
  type        = string
  default     = ""
}

variable "costAllocation" {
  description = "The cost allocation method (can only be sharedcosts or chargeback)"
  type        = string
  default     = ""
}

variable "costbaseline" {
  description = "The year the resource was created"
  type        = string
  default     = ""
}

variable "appFunction" {
  description = "The function of the application"
  type        = string
  default     = ""
}

variable "monthlyBudget" {
  description = "The monthly budget for the application"
  type        = string
  default     = ""
}

variable "costRegion" {
  description = "The resource deployment location"
  type        = string
  default     = ""
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

