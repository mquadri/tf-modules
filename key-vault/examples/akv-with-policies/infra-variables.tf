variable "infra_rg_vnet_name" {
  type        = string
  description = "name of the resource group for the vnet"
}
variable "infra_rg_app_name" {
  type        = string
  description = "name of the resource group for the application"
}
variable "infra_vnet_name" {
  type        = string
  description = "name of the vnet"
}

variable "infra_subnet_pe_name" {
  type        = string
  description = "name subnet used for private endpoints"
}

variable "private_dns_rg" {
  type        = string
  description = "private dns zone resource group"
  default     = "rg-dns_infrastructure"
}


variable "mgmt_sub_id" {
  type        = string
  description = "the mgmt subcription id for where the private dns zones reside"
  default     = "000bdcc8-114c-418a-ad9d-a1ac486ac658"
}

variable "tenant_id" {
  type        = string
  description = "tenant id where the subscription to deploy the aks cluster is"
  default     = "72b17115-9915-42c0-9f1b-4f98e5a4bcd2"
}

variable "resourcetype" {
  type        = string
  description = "the resource type for the resource"

}

variable "management_group_name" {
  type        = string
  description = "the management group name for the resource"

}

variable "application_name" {
  type        = string
  description = "the application name for the resource"

}

variable "subnet_id" {
  type        = string
  description = "the subnet id for the resource"

}

variable "rbac_enabled" {
  type        = bool
  description = "whether to enable rbac for the key vault"
  default     = false

}

variable "appid" {
  type        = string
  description = "the application id for the resource"

}

variable "msftmigration" {
  type        = bool
  description = "whether to enable msft migration for the key vault"
  default     = false

}

############################################################
## Naming and Tags ##
############################################################
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}


variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  default     = "01"
}

variable "costDivision" {
  description = "cost division"
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

#subscription
variable "subscription_id" {
  description = "The id of the subscription."
  type        = string
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
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

