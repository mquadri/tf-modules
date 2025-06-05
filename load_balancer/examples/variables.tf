
variable "diagnostic_settings_name" {
  description = "The name of the diagnostic settings"
  type        = string
  default     = "custom-diag-law"
}
variable "vnet_name" {
  description = "The name of the diagnostic settings"
  type        = string
  default     = ""
}
variable "appname" {
  description = "The name of the application"
  type        = string
  default     = ""
}

variable "env" {
  description = "The environment for the application"
  type        = string
  default     = ""
}


variable "frontend_ip_configurations" {
  type = map(object({
    name                                               = optional(string)
    frontend_private_ip_address                        = optional(string)
    frontend_private_ip_address_version                = optional(string)
    frontend_private_ip_address_allocation             = optional(string, "Dynamic")
    frontend_private_ip_subnet_resource_id             = optional(string)
    gateway_load_balancer_frontend_ip_configuration_id = optional(string)
    public_ip_address_resource_name                    = optional(string)
    public_ip_address_resource_id                      = optional(string)
    public_ip_prefix_resource_id                       = optional(string)
    # frontend_private_ip_zones                                  = optional(set(string), [1, 2, 3])
    tags                              = optional(map(any), {})
    create_public_ip_address          = optional(bool, false)
    new_public_ip_resource_group_name = optional(string)
    new_public_ip_location            = optional(string)
    inherit_lock                      = optional(bool, true)
    lock_type_if_not_inherited        = optional(string, null)
    inherit_tags                      = optional(bool, true)
    edge_zone                         = optional(string)
    zones                             = optional(list(string), ["1", "2", "3"])

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false) # only set to true IF using service principal
      condition                              = optional(string, null)
      condition_version                      = optional(string, null) # Valid values are 2.0
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})

    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
  }))
  description = <<DESCRIPTION
  A map of objects that builds frontend ip configurations for the load balancer. 
  You need at least one frontend ip configuration to deploy a load balancer.

  - `name`: (Optional) The name of the frontend IP configuration. Changing this forces a new resource to be created
  - `frontend_private_ip_address`: (Optional) A string parameter that is the private IP address to assign to the Load Balancer. The last one and first four IPs in any range are reserved and cannot be manually assigned.
  - `frontend_private_ip_address_version`: (Optional) A string parameter that is the version of IP that the private IP address is. Possible values are IPv4 or IPv6
  - `frontend_private_ip_address_allocation`: (Optional) A string parameter that is the allocation method for the private IP address used by this Load Balancer. Possible values as Dynamic or Static
  - `frontend_private_ip_subnet_resource_id`: (Optional) A string parameter that is the ID of the subnet which should be associated with the IP configuration. If desired to use the same subnet for each frontend ip configuration, use frontend_subnet_resource_id, or use frontend_vnet_name and frontend_subnet_name. If for public ip configuration, leave parameter empty/null.
  - `public_ip_address_resource_name`: (Optional) A string parameter that is the name of the public ip address to be created AND associated with the Load Balancer. Changing this forces a new Public IP to be created.
  - `public_ip_address_resource_id`: (Optional) A string parameter that is the ID of a public ip address which should associated with the Load Balancer.
  - `public_ip_prefix_resource_id`: (Optional) A string parameter that is the ID of a public IP prefixes which should be associated with the Load Balancer. Public IP prefix can only be used with outbound rules
  - `frontend_private_ip_zones`: (Optional) A  set of strings that specifies a list of availability zones in which the private IP address for this Load Balancer should be located.
  - `tags`: (Optional) = A mapping of tags to assign to the individual public IP resource.
  - `create_public_ip_address`: (Optional) A boolean parameter to create a new public IP address resource for the Load Balancer
  - `new_public_ip_resource_group_name`: (Optional) A string for the name of the resource group to place the newly created public IP into. If null, will choose `location` from `public_ip_address_configuration` or `location` for the Load Balancer.
  - `new_public_ip_location`: (Optional) A string parameter for the location to deploy the public IP address resource.
  - `inherit_lock`: (Optional)  A boolean to determine if the lock from the Load Balancer will be inherited by the public IP.
  - `lock_type_if_not_inherited`: (Optional) An optional string to determine what kind of lock will be placed on the public IP is not inherited from the Load Balancer
  - `inherit_tags`: (Optional) A boolean to determine if the public IP will inherit tags from the Load Balancer.
  - `edge_zone`: (Optional) A string that specifies the Edge Zone within the Azure Region where this public IP should exist. Changing this forces a new Public IP to be created.
  - `zones`: (Optional) A list of strings that contains the availability zone to allocate the public IP in. Changing this forces a new resource to be created.
  - `role_assignments`: A map of objects that assigns a given principal (user or group) to a given role.
    - `role_definition_id_or_name`: The ID or name of the role definition to assign to the principal.
    - `principal_id`: The ID of the principal to assign the role to.
    - `description`: (Optional) A description of the role assignment.
    - `skip_service_principal_aad_check`: (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. This should only be set to true if using a service principal. Defaults to false.
    - `condition`: (Optional) A condition that will be used to scope the role assignment.
    - `condition_version`: (Optional) The version of the condition syntax. Valid values are '2.0'. Defaults to null.
    - `delegated_managed_identity_resource_id`: (Optional) The resource ID of the delegated managed identity.
  - `diagnostic_settings`: A map of objects that manage a Diagnostic Setting.
    - `name`: (Optional) The name of the diagnostic setting.
    - `log_groups`: (Optional) A set of log groups. Defaults to a set containing "allLogs".
    - `metric_categories`: (Optional) A set of metric categories. Defaults to a set containing "AllMetrics".
    - `log_analytics_destination_type`: (Optional) The destination type for log analytics. Defaults to "Dedicated".
    - `workspace_resource_id`: (Optional) The resource ID of the workspace. Defaults to null. This is a required field if `storage_account_resource_id`, `event_hub_authorization_rule_resource_id`, and `marketplace_partner_resource_id` are not set.
    - `storage_account_resource_id`: (Optional) The resource ID of the storage account. Defaults to null. This is a required field if `workspace_resource_id`, `event_hub_authorization_rule_resource_id`, and `marketplace_partner_resource_id` are not set.
    - `event_hub_authorization_rule_resource_id`: (Optional) The resource ID of the event hub authorization rule. Defaults to null. This is a required field if `workspace_resource_id`, `storage_account_resource_id`, and `marketplace_partner_resource_id` are not set.
    - `event_hub_name`: (Optional) The name of the event hub. Defaults to null.
    - `marketplace_partner_resource_id`: (Optional) The resource ID of the marketplace partner. Defaults to null. This is a required field if `workspace_resource_id`, `storage_account_resource_id`, and `event_hub_authorization_rule_resource_id` are not set.

  Example Input:
  ```terraform
  # Standard Regional IPv4 Private Ip Configuration
  frontend_ip_configurations = {
    frontend_configuration_1 = {
      name = "internal_lb_private_ip_1_config"
      frontend_private_ip_address_version    = "IPv4"
      frontend_private_ip_address_allocation = "Dynamic"
    }

  # Standard Regional IPv4 Public IP Frontend IP Configuration
  frontend_ip_configurations = {
    frontend_configuration_1 = {
      name                     = "public_lb_public_ip_1_config"
      public_ip_address_name = "public_lb_public_ip_1"
      create_public_ip_address = true
    }
  }
  ```
  DESCRIPTION

  # validation {
  #   condition = length([for obj in var.frontend_ip_configurations :
  #     true
  #   if(contains(["IPv4", "IPv6"], obj.frontend_private_ip_address_version))]) == length(var.frontend_ip_configurations)
  #   error_message = "The accepted values for `frontend_private_ip_address_version` are IPv4 or IPv6"
  # }
  default = {}
  validation {
    condition = length([for obj in var.frontend_ip_configurations :
      true
    if(contains(["Dynamic", "Static"], obj.frontend_private_ip_address_allocation))]) == length(var.frontend_ip_configurations)
    error_message = "The accepted values for `frontend_private_ip_address_allocation` are `Dynamic` or `Static`"
  }
}
variable "log_analytics_workspace" {
  description = "The name of the Log Analytics Workspace"
  type        = string
  default     = ""
}
variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = ""
}
variable "builtin_role" {
  description = "The name of the built-in role for role assignment"
  type        = string
  default     = "contributor"
}

variable "name" {
  type        = string
  description = <<DESCRIPTION
  The name of the load balancer.
  DESCRIPTION
  nullable    = false
  default     = ""
}

### Required Variables
variable "resource_group_name" {
  type        = string
  description = <<DESCRIPTION
  The name of the resource group where the load balancer will be deployed.
  DESCRIPTION
  nullable    = false
  default     = ""
}

### Telemetry Toggle
variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
  This variable controls whether or not telemetry is enabled for the module.
  For more information see https://aka.ms/avm/telemetry.
  If it is set to false, then no telemetry will be collected.
  DESCRIPTION
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

