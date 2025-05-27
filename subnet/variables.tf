#naming and tags
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
}

# tflint-ignore: terraform_unused_declarations
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
  default     = null
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costCostCenter" {
  condition = var.costCostCenter != null
  summary   = "WARNING: Deprecation Notice, costCostCenter is not longer used, please remove this variable from your configuration"
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costVP" {
  condition = var.costVP != null
  summary   = "WARNING: Deprecation Notice, costVP is not longer used, please remove this variable from your configuration"
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerTech" {
  condition = var.costAppOwnerTech != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerTech is not longer used, please remove this variable from your configuration"
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerManager" {
  condition = var.costAppOwnerManager != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerManager is not longer used, please remove this variable from your configuration"
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costBudgetOwner" {
  condition = var.costBudgetOwner != null
  summary   = "WARNING: Deprecation Notice, costBudgetOwner is not longer used, please remove this variable from your configuration"
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

variable "costDivision" {
  description = "cost division"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costDivision" {
  condition = var.costDivision != null
  summary   = "WARNING: Deprecation Notice, costDivision is not longer used, please remove this variable from your configuration"
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAllocation" {
  condition = var.costAllocation != null
  summary   = "WARNING: Deprecation Notice, costAllocation is not longer used, please remove this variable from your configuration"
}

variable "appFunction" {
  description = "app function"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appFunction" {
  condition = var.appFunction != null
  summary   = "WARNING: Deprecation Notice, appFunction is not longer used, please remove this variable from your configuration"
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "monthlyBudget" {
  condition = var.monthlyBudget != null
  summary   = "WARNING: Deprecation Notice, monthlyBudget is not longer used, please remove this variable from your configuration"
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = null
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costbaseline" {
  condition = var.costbaseline != null
  summary   = "WARNING: Deprecation Notice, costbaseline is not longer used, please remove this variable from your configuration"
}

variable "vnet_resource_group_name" {
  description = "The name of the resource group where the parent VNET exists"
  type        = string
}

variable "vnet_name" {
  description = "The name of the VNET where this subnet will be created"
  type        = string
}

variable "service_endpoint_list" {
  description = "A list of service endpoints delegated to this VNET"
  type        = list(string)
  default     = []
}

# tflint-ignore: terraform_unused_declarations
variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = <<DESCRIPTION
    DEPRECATED: v2.3.0 ignores it. Please use 'private_endpoint_network_policies' instead for versions >= v2.3.0
    A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false.
  DESCRIPTION
  type        = map(bool)
  default     = {}
}

variable "address_prefix" {
  type        = string
  default     = null
  description = "CIDR block for subnet"
}

variable "subnet_delegations" {
  description = <<EOT
  A complex collection of variables which enables subnet delegation to a specific service."
  name:  (Required) The name of service to delegate to. Possible values are Microsoft.ApiManagement/service, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.Logic/integrationServiceEnvironments, Microsoft.LabServices/labplans, Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/dnsResolvers, Microsoft.Network/managedResolvers, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, Microsoft.Orbital/orbitalGateways, NGINX.NGINXPLUS/nginxDeployments, PaloAltoNetworks.Cloudngfw/firewalls, and Qumulo.Storage/fileSystems
  actions:  A list of Actions which should be delegated. Although  this argument is optional , it is recommended to pass values for this argument to avoid unexpected results when workflows are rerun for updates to infrastructure after deployment. This list is specific to the service to delegate to. Possible values are Microsoft.Network/networkinterfaces/*, Microsoft.Network/publicIPAddresses/join/action, Microsoft.Network/publicIPAddresses/read, Microsoft.Network/virtualNetworks/read, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
  EOT
  type = map(object({
    name    = string
    actions = list(string)
  }))
  default = {}
}

variable "name" {
  type        = string
  default     = null
  description = "override the name of the subnet"
}


# Other settings

variable "default_outbound_access_enabled" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
(Optional) Determines whether default outbound internet access is enabled for this subnet. This can only be set at create time.
DESCRIPTION
  nullable    = false
}

variable "nat_gateway" {
  type = object({
    id = string
  })
  default     = null
  description = <<DESCRIPTION
(Optional) The ID of the NAT Gateway to associate with the subnet. Changing this forces a new resource to be created.
DESCRIPTION
}

variable "network_security_group" {
  type = object({
    id = string
  })
  default     = null
  description = <<DESCRIPTION
(Optional) The ID of the Network Security Group to associate with the subnet. Changing this forces a new resource to be created.
DESCRIPTION
}

variable "private_endpoint_network_policies" {
  type        = string
  default     = "Enabled"
  description = <<DESCRIPTION
(Optional) Enable or Disable network policies for the private endpoint on the subnet. Possible values are `Disabled`, `Enabled`, `NetworkSecurityGroupEnabled` and `RouteTableEnabled`. Defaults to `Enabled`.
DESCRIPTION
  nullable    = false
}

variable "private_link_service_network_policies_enabled" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
(Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to `true` will **Enable** the policy and setting this to `false` will **Disable** the policy. Defaults to `true`.
DESCRIPTION
  nullable    = false
}

variable "role_assignments" {
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default     = {}
  description = <<DESCRIPTION
  (Optional) A map of role assignments to create on the subnet. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.
  
  - `role_definition_id_or_name` - The ID or name of the role definition to assign to the principal.
  - `principal_id` - The ID of the principal to assign the role to.
  - `description` - (Optional) The description of the role assignment.
  - `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.
  - `condition` - (Optional) The condition which will be used to scope the role assignment.
  - `condition_version` - (Optional) The version of the condition syntax. Leave as `null` if you are not using a condition, if you are then valid values are '2.0'.
  - `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.
  - `principal_type` - (Optional) The type of the `principal_id`. Possible values are `User`, `Group` and `ServicePrincipal`. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.
  
  > Note: only set `skip_service_principal_aad_check` to true if you are assigning a role to a service principal.
  DESCRIPTION
  nullable    = false
}

variable "route_table" {
  type = object({
    id = string
  })
  default     = null
  description = <<DESCRIPTION
(Optional) The ID of the route table to associate with the subnet.
DESCRIPTION
}

variable "service_endpoint_policies" {
  type = map(object({
    id = string
  }))
  default     = null
  description = <<DESCRIPTION
(Optional) A set of service endpoint policy IDs to associate with the subnet.
  DESCRIPTION
}

variable "sharing_scope" {
  type        = string
  default     = null
  description = <<DESCRIPTION
(Optional) The sharing scope for the subnet. Possible values are `DelegatedServices` and `Tenant`. Defaults to `DelegatedServices`.
DESCRIPTION
}

variable "subscription_id" {
  type        = string
  default     = null
  description = <<DESCRIPTION
  (Optional) The subscription ID to use for the feature registration.
DESCRIPTION
}

variable "virtual_network" {
  type = object({
    resource_id = string
  })
  description = <<DESCRIPTION
  (Required) The Virtual Network, into which the subnet will be created.

  - resource_id - The ID of the Virtual Network.
  DESCRIPTION
  nullable    = true
  default     = null
}
