## Naming and Tags ##
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

# Databricks Serverless compute variables

variable "private_endpoint_rules_storage" {
  description = <<DESCRIPTION
A map of the storage_ids and scopes for the storage accounts that will be connected to the Databricks workspace.

- `resource_id` - The Azure resource ID of the target storage account
- `group_id` - The sub-resource type (group ID) of the target resource. Must be one of blob or dfs. Note that to connect to workspace root storage (root DBFS), you need two endpoints, one for blob and one for dfs. Change forces creation of a new resource.
  DESCRIPTION
  type = map(object({
    resource_id = string
    group_id    = string
  }))
  default  = {}
  nullable = false
  validation {
    condition     = alltrue([for _, v in var.private_endpoint_rules_storage : contains(["blob", "dfs"], v.group_id)])
    error_message = "group_id must be one of blob or dfs"
  }
}

variable "databricks_workspace_id" {
  description = "The Databricks workspace ID"
  type        = number
}


variable "private_endpoint_rules_sql_server" {
  description = <<DESCRIPTION
A list of the sql_server_ids that will be connected to the Databricks workspace.
DESCRIPTION
  type        = list(string)
  default     = []
  nullable    = false

}

variable "private_endpoint_rules_mysql" {
  description = <<DESCRIPTION
A list of the mysql_ids that will be connected to the Databricks workspace.
DESCRIPTION
  type        = list(string)
  default     = []
  nullable    = false
}

