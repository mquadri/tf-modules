variable "openai_resource_name" {
  type        = string
  description = "(Required) Specifies the name of the Cognitive Service Account. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The location to create the AI Search Resource."
}

variable "openai_sku_name" {
  type        = string
  default     = "S0"
  description = "(Optional) The SKU of the Cognitive Service Account."
}

variable "dynamic_throttling_enabled" {
  type        = bool
  description = "(Optional) Whether to enable the dynamic throttling for this Cognitive Service Account."
  default     = false
}

variable "fqdns" {
  type        = list(string)
  default     = null
  description = "(Optional) A list of fully qualified domain names (FQDNs) that are associated with this Cognitive Service Account."
}

variable "custom_subdomain_name" {
  type        = string
  default     = null
  description = "(Optional) The custom subdomain name for the Cognitive Service Account."
}

variable "customer_managed_key" {
  type = object({
    key_vault_key_id = string
  })
  default     = null
  description = "(Optional) Specifies the customer managed key for the Cognitive Service Account."
}
variable "storage" {
  type = object({
    storage_account_id = string
    identity_client_id = string
  })
  default     = null
  description = "(Optional) Specifies the storage account for the Cognitive Service Account."
}

variable "azurerm_cognitive_deployment" {
  type = map(object({
    rai_policy_name = optional(string)
    name            = string
    model = object({
      format  = string
      name    = string
      version = string
    })
    sku = object({
      name     = string
      tier     = optional(string)
      size     = optional(string)
      family   = optional(string)
      capacity = optional(number, 1)
    })
  }))
  description = <<-EOT
    (Required) Scale block supports below values:
    rai_policy_name = "(Optional) The name of RAI policy."
    name = "(Required) The name of the Cognitive Deployment. Changing this forces a new resource to be created."
    model = "(Required) The model block supports below values:"
    - format  = "(Required) The format of the model. Possible values are OpenAI, ONNX, TensorFlow, TensorFlowLite, TensorFlowSavedModel, TensorFlowJS, PyTorch, ScikitLearn, PMML, CoreML, Custom, and Other."
    - name    = "(Required) The name of the model. Changing this forces a new resource to be created."
    - version = "(Required) The version of the model. Changing this forces a new resource to be created."
    scale = "(Required) The scale block supports below values:"
    - type     = "(Required) The name of the SKU. Ex - Standard or P3. It is typically a letter+number code. Changing this forces a new resource to be created."
    - tier     = "(Optional) Possible values are Free, Basic, Standard, Premium, Enterprise. Changing this forces a new resource to be created."
    - size     = "(Optional) The SKU size. When the name field is the combination of tier and some other value, this would be the standalone code. Changing this forces a new resource to be created."
    - family   = "(Optional) If the service has different generations of hardware, for the same SKU, then that can be captured here. Changing this forces a new resource to be created."
    - capacity = "(Optional) Tokens-per-Minute (TPM). The unit of measure for this field is in the thousands of Tokens-per-Minute. Defaults to 1 which means that the limitation is 1000 tokens per minute. If the resources SKU supports scale in/out then the capacity field should be included in the resources' configuration. If the scale in/out is not supported by the resources SKU then this field can be safely omitted."
  EOT
}

variable "content_filtering" {
  type = map(object({
    basePolicyName = string
    mode           = string
    contentFilters = list(object({
      name              = string
      blocking          = bool
      enabled           = bool
      severityThreshold = optional(string)
      source            = string
    }))
    customBlocklists = optional(list(object({
      blocking      = bool
      blocklistName = string
      source        = string
    })))
  }))
  description = <<-EOT
    Map of objects containing the content filtering information to be created.
      The key is the name of the data source.
      The value is an object with the following attributes:
      - basePolicyName = "(Required) The name of the base policy."
      - mode = "(Required) The mode of the content filtering. Possible values are 'Blocking', 'Default' or 'Deferred'."
      - contentFilters = "(Required) The content filters block supports below values:"
        - name = "(Required) The name of the content filter."
        - blocking = "(Required) Whether the content filter is blocking or not."
        - enabled = "(Required) Whether the content filter is enabled or not."
        - severityThreshold = "(Required) The allowed content level. Possible values are 'Low', 'Medium', 'High'."
        - source = "(Required) The source of the content filter. Possible values are 'Completion', 'Prompt'."
      - customBlocklists = "(Optional) The custom blocklists block supports below values:"
        - blocking = "(Required) Whether the custom blocklist is blocking or not."
        - blocklistName = "(Required) The name of the custom blocklist."
        - source = "(Required) The source of the custom blocklist. Possible values are 'Completion', 'Prompt'."
  EOT
  default     = {}
}
variable "managed_identity" {
  type = map(object({
    user_managed_identity_name           = string
    managed_identity_location            = string
    managed_identity_resource_group_name = string
    tags                                 = optional(map(string))
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))
    enable_telemetry = optional(bool, false)

  }))
  description = "user assigned managed identity block"
  default     = {}
}
variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default     = {}
}
################ Rbac assignment#######################
#######################################################
variable "enable_encryption" {
  description = "Enable encryption for the resources"
  type        = bool
  default     = false
}
variable "key_vault_name" {
  description = "The name of the Key Vault"
  type        = string
  default     = ""
}
variable "key_vault_rg_name" {
  description = "Resource group name for the Key Vault"
  type        = string
  default     = ""
}
variable "userIdentities" {
  description = "When using managed identity, the user identities that will be assigned to the openAI service"
  type        = list(string)
  default     = []
}
variable "identity_type" {
  type        = string
  default     = "SystemAssigned"
  description = "(Optional) Specifies the identity for the Cognitive Service Account."
}
variable "existing_user_assigned_identity_name" {
  description = "The name of the existing user assigned identity"
  type        = string
  default     = ""
}
#tag variables

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = ""
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costcostcenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costvp" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costappownertech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

variable "costappownermanager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "costbudgetowner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
  default     = ""
}

variable "costdivision" {
  description = "cost division"
  type        = string
  default     = ""
}
variable "customer_managed_key" {
  type = object({
    key_vault_key_id   = string
    identity_client_id = string
  })
  default     = null
  description = "(Optional) Specifies the customer managed key for the Cognitive Service Account."
}
# variable "costallocation" {
#   description = "can only be sharedcosts or chargeback"
#   type        = string
#   default     = ""
# }

variable "appfunction" {
  description = "app function"
  type        = string
  default     = ""
}

variable "monthlybudget" {
  description = "monthly budget"
  type        = string
  default     = ""
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = ""
}

variable "managed_by" {
  description = "resource group is managed by"
  type        = string
  default     = null
}

############################################private endpoint############################
variable "private_endpoints" {
  type = map(object({
    name                           = string
    is_manual_connection           = optional(bool)
    private_connection_resource_id = optional(string)
    subresource_names              = list(string)
    request_message                = optional(string)
    private_dns_zone_group_name    = optional(string)
    private_dns_zone_ids           = optional(list(string))
  }))
  description = "Private Endpoints for the supported resources"
  default     = {}
}

variable "subscription_id" {
  type    = string
  default = null
}

variable "pe_subnet_name" {
  type    = string
  default = null
}

variable "virtual_network_name" {
  default = null
  type    = string
}

variable "virtual_network_rg" {
  default = null
  type    = string
}

variable "resource_group_name" {
  default = null
  type    = string
}

variable "domain_name" {
  type        = string
  description = "The name of the private dns zone."
}


variable "a_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a A record."
}

variable "aaaa_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a AAAA record."
}

variable "cname_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    record              = string
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a CNAME record."
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see https://aka.ms/avm/telemetryinfo.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
}

variable "mx_records" {
  type = map(object({
    name                = optional(string, "@")
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      preference = number
      exchange   = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a MX record."
}

variable "ptr_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records             = list(string)
    tags                = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a PTR record."
}

variable "soa_record" {
  type = object({
    email        = string
    expire_time  = optional(number, 2419200)
    minimum_ttl  = optional(number, 10)
    refresh_time = optional(number, 3600)
    retry_time   = optional(number, 300)
    ttl          = optional(number, 3600)
    tags         = optional(map(string), null)
  })
  default     = null
  description = "optional soa_record variable, if included only email is required, rest are optional. Email must use username.corp.com and not username@corp.com"
}

variable "srv_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      priority = number
      weight   = number
      port     = number
      target   = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a SRV record."
}

variable "txt_records" {
  type = map(object({
    name                = string
    resource_group_name = string
    zone_name           = string
    ttl                 = number
    records = map(object({
      value = string
    }))
    tags = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a TXT record."
}

variable "virtual_network_links" {
  type = map(object({
    vnetlinkname     = string
    vnetid           = string
    autoregistration = optional(bool, false)
    tags             = optional(map(string), null)
  }))
  default     = {}
  description = "A map of objects where each object contains information to create a virtual network link."
}

variable "create_dns_zone" {
  type    = bool
  default = false
}

variable "dns_zone_id" {
  description = "The ID of the DNS zone if provided by the user"
  type        = string
  default     = ""
}

variable "enable_private_endpoint" {
  description = "controls whether or not to create private endpoints"
  type        = bool
  default     = true
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

