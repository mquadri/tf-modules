variable "subscriptionId" {
  type        = string
  description = "The subscription id under which the resource will be created."
}

variable "resourceGroupName" {
  type        = string
  description = "The Azure Resource Group name in which all resources in this example should be created."
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources in this example should be created."
}

variable "malName" {
  type        = string
  description = "MAL Name of the application. Should be <= 15 alpha-numeric characters."
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "appnameStorage" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
}
variable "appFunction" {
  description = "app function"
  type        = string
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

variable "storageAccountName" {
  type        = string
  description = "Your storage account name."
}

variable "functionAppRuntime" {
  type        = string
  description = "The runtime for your app. One of the following: 'dotnet-isolated', 'python', 'java', 'node', 'powershell'"
}

variable "functionAppRuntimeVersion" {
  type        = number
  description = "The runtime and version for your app. One of the following: '3.10', '3.11', '7.4', '8.0', '10', '11', '17', '20'"
}

variable "functionAppAccessADgroup" {
  type        = string
  description = "Azure Entra group for access to the Function App"
}

variable "server_farm_body" {
  description = "The body configuration for the server farm."
  type = object({
    kind = string
    sku = object({
      capacity = optional(number, null)
      family   = optional(string, null)
      name     = string
      size     = optional(string, null)
      tier     = string
    })
    properties = object({
      reserved = bool
    })
  })
  default = {
    kind = "functionapp"
    sku = {
      name = "FC1"
      tier = "FlexConsumption"
    }
    properties = {
      reserved = true
    }
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}