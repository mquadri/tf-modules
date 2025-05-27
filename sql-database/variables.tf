variable "database_names" {
  type = map(object({

    name                                                       = string
    server_id                                                  = string
    collation                                                  = optional(string, null)
    max_size_gb                                                = optional(number, null)
    sku_name                                                   = optional(string, null)
    zone_redundant                                             = optional(string, null)
    elastic_pool_id                                            = optional(string, null)
    create_mode                                                = optional(string, null)
    creation_source_database_id                                = optional(string, null)
    restore_point_in_time                                      = optional(string, null)
    auto_pause_delay_in_minutes                                = optional(number, null)
    enclave_type                                               = optional(string, null)
    geo_backup_enabled                                         = optional(bool, null)
    maintenance_configuration_name                             = optional(string, null)
    ledger_enabled                                             = optional(bool, null)
    license_type                                               = optional(string, null)
    min_capacity                                               = optional(string, null)
    recover_database_id                                        = optional(string, null)
    recovery_point_id                                          = optional(string, null)
    restore_dropped_database_id                                = optional(string, null)
    restore_long_term_retention_backup_id                      = optional(string, null)
    read_replica_count                                         = optional(number, null)
    read_scale                                                 = optional(string, null)
    sample_name                                                = optional(string, null)
    storage_account_type                                       = optional(string, null)
    transparent_data_encryption_enabled                        = optional(bool, null)
    transparent_data_encryption_key_vault_key_id               = optional(string, null)
    transparent_data_encryption_key_automatic_rotation_enabled = optional(bool, null)
    secondary_type                                             = optional(string, null)
    tags                                                       = optional(map(string), null)

  }))
  description = <<DESCRIPTION
List of databases to be created along with variables to be added

- `name` - (Required) The name of the database to be created.
- `server_id` - (Required) The id of the MS SQL Server on which to create the database. Changing this forces a new resource to be created.
- `collation` - (Optional) Specifies the collation of the database. Changing this forces a new resource to be created.
- `max_size_gb` -  (Optional) The max size of the database in gigabytes.
- `sku_name` - (Optional) Specifies the name of the SKU used by the database.
- `zone_redundant` - (Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases.
- `elastic_pool_id` - (Optional) Specifies the ID of the elastic pool containing this database.
- `create_mode` - (Optional) The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Recovery, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup and Secondary. Mutually exclusive with import. Changing this forces a new resource to be created. Defaults to Default.
- `creation_source_database_id` - (Optional) The ID of the source database from which to create the new database.
- `restore_point_in_time` - (Optional) Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database. 
- `auto_pause_delay_in_minutes` - (Optional) Time in minutes after which database is automatically paused.
- `enclave_type` - (Optional) Specifies the type of enclave to be used by the elastic pool. When enclave_type is not specified (e.g., the default) enclaves are not enabled on the database. Possible values are Default or VBS.
- `geo_backup_enabled` -(Optional) A boolean that specifies if the Geo Backup Policy is enabled. Defaults to true.
- `maintenance_configuration_name` - (Optional) The name of the Public Maintenance Configuration window to apply to the database.
- `ledger_enabled` - (Optional) A boolean that specifies if this is a ledger database. Defaults to false. Changing this forces a new resource to be created.
- `license_type` - (Optional) Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice.
- `min_capacity` - (Optional) Minimal capacity that database will always have allocated, if not paused. This property is only settable for Serverless databases.
- `recover_database_id` - (Optional) The ID of the database to be recovered. This property is only applicable when the create_mode is Recovery.
- `recovery_point_id` - (Optional) The ID of the Recovery Services Recovery Point Id to be restored. This property is only applicable when the create_mode is Recovery.
- `restore_dropped_database_id` - (Optional) The ID of the database to be restored. This property is only applicable when the create_mode is Restore.
- `restore_long_term_retention_backup_id` - (Optional) The ID of the long term retention backup to be restored. This property is only applicable when the create_mode is RestoreLongTermRetentionBackup.
- `read_replica_count` - (Optional) The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. 
- `read_scale` - (Optional) If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica.
- `sample_name` -  (Optional) Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT.
- `storage_account_type` - (Optional) Specifies the storage account type used to store backups for this database. Possible values are Geo, GeoZone, Local and Zone. Defaults to Geo.
- `transparent_data_encryption_enabled` - (Optional) If set to true, Transparent Data Encryption will be enabled on the database. Defaults to true.
- `transparent_data_encryption_key_vault_key_id` - (Optional) The fully versioned Key Vault Key URL
- `transparent_data_encryption_key_automatic_rotation_enabled` -  (Optional) Boolean flag to specify whether TDE automatically rotates the encryption Key to latest version or not. Possible values are true or false. Defaults to false.
- `secondary_type` - (Optional) How do you want your replica to be made? Valid values include Geo and Named. Defaults to Geo. Changing this forces a new resource to be created.
- `tags` - (Optional) A mapping of tags to assign to the resource.

DESCRIPTION
  default     = {}
}

#Naming and Tags 
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "location" {
  condition = var.location != null
  summary   = "WARNING: Deprecation Notice, location is not loger used, please remove this variable from your configuration"
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "resourcetype" {
  condition = var.resourcetype != null
  summary   = "WARNING: Deprecation Notice, resourcetype is not loger used, please remove this variable from your configuration"
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appid" {
  condition = var.appid != null
  summary   = "WARNING: Deprecation Notice, appid is not loger used, please remove this variable from your configuration"
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appname" {
  condition = var.appname != null
  summary   = "WARNING: Deprecation Notice, appname is not loger used, please remove this variable from your configuration"
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "env" {
  condition = var.env != null
  summary   = "WARNING: Deprecation Notice, env is not loger used, please remove this variable from your configuration"
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costCostCenter" {
  condition = var.costCostCenter != null
  summary   = "WARNING: Deprecation Notice, costCostCenter is not loger used, please remove this variable from your configuration"
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costVP" {
  condition = var.costVP != null
  summary   = "WARNING: Deprecation Notice, costVP is not loger used, please remove this variable from your configuration"
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerTech" {
  condition = var.costAppOwnerTech != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerTech is not loger used, please remove this variable from your configuration"
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAppOwnerManager" {
  condition = var.costAppOwnerManager != null
  summary   = "WARNING: Deprecation Notice, costAppOwnerManager is not loger used, please remove this variable from your configuration"
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costBudgetOwner" {
  condition = var.costBudgetOwner != null
  summary   = "WARNING: Deprecation Notice, costBudgetOwner is not loger used, please remove this variable from your configuration"
}

variable "costDivision" {
  description = "cost division"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costDivision" {
  condition = var.costDivision != null
  summary   = "WARNING: Deprecation Notice, costDivision is not loger used, please remove this variable from your configuration"
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costAllocation" {
  condition = var.costAllocation != null
  summary   = "WARNING: Deprecation Notice, costAllocation is not loger used, please remove this variable from your configuration"
}

variable "appFunction" {
  description = "app function"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "appFunction" {
  condition = var.appFunction != null
  summary   = "WARNING: Deprecation Notice, appFunction is not loger used, please remove this variable from your configuration"
}

variable "monthlyBudget" {
  description = "monthly budget"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "monthlyBudget" {
  condition = var.monthlyBudget != null
  summary   = "WARNING: Deprecation Notice, monthlyBudget is not loger used, please remove this variable from your configuration"
}

variable "costbaseline" {
  description = "year resource created"
  type        = string
  default     = ""
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "costbaseline" {
  condition = var.costbaseline != null
  summary   = "WARNING: Deprecation Notice, costbaseline is not loger used, please remove this variable from your configuration"
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
    condition     = contains(["PROD", "TEST", "DEV", "SANDBOX","NON-PROD"], var.environment)
    error_message = "The environment must be one of the following values: PROD, TEST, DEV, SANDBOX, NON-PROD"
  }
}

variable "msftmigration" {
  description = "The migration tag used."
  type        = string
}
