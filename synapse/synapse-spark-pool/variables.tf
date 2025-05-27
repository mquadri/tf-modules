variable "synapse_spark_pool_name" {
  description = "The name which should be used for this Synapse Spark Pool. Changing this forces a new Synapse Spark Pool to be created."
}

variable "synapse_workspace_id" {
  description = "The ID of the Synapse Workspace where the Synapse Spark Pool should exist. Changing this forces a new Synapse Spark Pool to be created."
}

variable "node_size_family" {
  description = "The kind of nodes that the Spark Pool provides. Possible value is MemoryOptimized."
  default     = "MemoryOptimized"
}

variable "node_size" {
  description = "The minimum number of nodes the Spark Pool can support. Must be between 3 and 200."
  default     = "Small"
}

variable "max_node_count" {
  description = "The maximum number of nodes the Spark Pool can support. Must be between 3 and 200."
  default     = "50"
}

variable "min_node_count" {
  description = "The minimum number of nodes in the Spark Pool."
  default     = "3"
}

variable "delay_in_minutes" {
  description = "Number of minutes of idle time before the Spark Pool is automatically paused. Must be between 5 and 10080."
  default     = "15"
}

variable "tags" {
}