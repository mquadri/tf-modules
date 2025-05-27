variable "resource_group_name" {
  description = "The name of the resource group in which the CosmosDB Account is created. Changing this forces a new resource to be created."
}

variable "location" {
  description = "Specifies the supported Azure location where the CosmosDB Account is created. Changing this forces a new resource to be created."
}

variable "location_zone_redundant" {
  description = "Indicates whether the main, write location is zone redundant."
  default     = false
}

variable "failover_location" {
  description = "The failover, read-only region were the resource will be deployed."
  default     = null
}

variable "failover_location_zone_redundant" {
  description = "Indicates whether the failover, read-only location is zone redundant."
  default     = false
}

variable "azurerm_cosmosdb_account_name" {
  description = "Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created."
}

variable "offer_type" {
  description = "Specifies the Offer Type to use for this CosmosDB Account. Currently this can only be set to 'Standard'."
  default     = "Standard"
}

variable "network_acl_bypass_for_azure_services" {
  description = "If azure services can bypass ACLs."
  default     = true
}

variable "kind" {
  description = "Specifies the Kind of CosmosDB to create. Possible values are 'GlobalDocumentDB' and 'MongoDB'. Changing this forces a new resource to be created."
  default     = "GlobalDocumentDB"
}

variable "enable_automatic_failover" {
  description = "Enable automatic failover for this Cosmos DB account."
  default     = false
}

variable "consistency_level" {
  description = "The Consistency Level to use for this CosmosDB Account. Possible values are 'BoundedStaleness', 'ConsistentPrefix', 'Eventual', 'Session' and 'Strong'."
  default     = "Session"
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this CosmosDB account."
  default     = false
}

variable "ip_range_filter" {
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account. IP addresses/ranges must be comma separated and must not contain any spaces."
  default     = null
}

variable "network_acl_bypass_ids" {
  description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
  default     = null
}

variable "is_virtual_network_filter_enabled" {
  description = "Enables virtual network filtering for this Cosmos DB account."
  default     = true
}

variable "backup_type" {
  description = "(Required) The type of the backup. Possible values are Continuous and Periodic. Defaults to Periodic. Migration of Periodic to Continuous is one-way, changing Continuous to Periodic forces a new resource to be created."
  default     = "Periodic"
}

variable "interval_in_minutes" {
  description = "(Optional) The interval in minutes between two backups. This is configurable only when type is Periodic. Possible values are between 60 and 1440."
  default     = null
  #Default Value: 240
}

variable "retention_in_hours" {
  description = "(Optional) The time in hours that each backup is retained. This is configurable only when type is Periodic. Possible values are between 8 and 720."
  default     = null
  #Default Value: 8
}

variable "storage_redundancy" {
  description = "(Optional) The storage redundancy which is used to indicate type of backup residency. This is configurable only when type is Periodic. Possible values are Geo, Local and Zone."
  default     = null
  #Default Value: Geo
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
}
