# Naming and Tags #
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
}

variable "costDivision" {
  description = "cost division"
  type        = string
}

variable "costAllocation" {
  description = "can only be sharedcosts or chargeback"
  type        = string
}





#HDInsight Spark Cluster Variables
variable "name" {
  type        = string
  default     = null
  description = "allow override of the HDInsight Spark Cluster name"
}

variable "cluster_version" {
  description = "Specifies the Version of HDInsights which should be used for this Cluster. Changing this forces a new resource to be created."
  type        = string
}

variable "tier" {
  description = "Specifies the Tier which should be used for this HDInsight Spark Cluster. Possible values are Standard or Premium. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
  validation {
    condition     = contains(["Standard", "Premium"], var.tier)
    error_message = "The only allowed values are 'Standard' or 'Premium'."
  }
}

variable "tls_min_version" {
  description = "The minimal supported TLS version. Possible values are 1.0, 1.1 or 1.2. Changing this forces a new resource to be created."
  type        = string
  default     = "1.2"
  validation {
    condition     = contains(["1.0", "1.1", "1.2"], var.tls_min_version)
    error_message = "The only allowed values are '1.0', '1.1', or '1.2'."
  }
}

variable "encryption_in_transit_enabled" {
  description = "Boolean flag to specify whether encryption in transit is enabled for this Cluster. Changing this forces a new resource to be created. Defaults to false"
  type        = bool
  default     = false
}

variable "spark_version" {
  description = "The version of Spark which should be used for this HDInsight Spark Cluster. Changing this forces a new resource to be created."
  type        = string
}

variable "gateway_username" {
  description = "Specifies the username of the gateway."
  type        = string
  default     = "gatewayuser"
}
variable "spark_gateway_password" {
  description = "Password for the Spark gateway"
  type        = string
  sensitive   = true
}
variable "storage_account_gen2" {
  description = "Configuration of Azure Data Lake Storage Gen2"
  type = object({
    storage_resource_id          = string
    filesystem_id                = string
    managed_identity_resource_id = string
  })
}

variable "nodes_username" {
  description = "Specifies the username of the nodes."
  type        = string
  default     = "sshuser"
}
variable "spark_nodes_password" {
  description = "Password for the Spark nodes"
  type        = string
  sensitive   = true
}
variable "head_node_vm_size" {
  description = "The Size of the Virtual Machine which should be used as the Head Nodes."
  type        = string
  validation {
    condition = contains([
      "ExtraSmall", "Small", "Medium", "Large", "ExtraLarge", "A5", "A6", "A7", "A8", "A9", "A10", "A11",
      "Standard_A1_V2", "Standard_A2_V2", "Standard_A2m_V2", "Standard_A3", "Standard_A4_V2", "Standard_A4m_V2",
      "Standard_A8_V2", "Standard_A8m_V2", "Standard_D1", "Standard_D2", "Standard_D3", "Standard_D4",
      "Standard_D11", "Standard_D12", "Standard_D13", "Standard_D14", "Standard_D1_V2", "Standard_D2_V2",
      "Standard_D3_V2", "Standard_D4_V2", "Standard_D5_V2", "Standard_D11_V2", "Standard_D12_V2", "Standard_D13_V2",
      "Standard_D14_V2", "Standard_DS1_V2", "Standard_DS2_V2", "Standard_DS3_V2", "Standard_DS4_V2", "Standard_DS5_V2",
      "Standard_DS11_V2", "Standard_DS12_V2", "Standard_DS13_V2", "Standard_DS14_V2", "Standard_E2_V3",
      "Standard_E4_V3", "Standard_E8_V3", "Standard_E16_V3", "Standard_E20_V3", "Standard_E32_V3",
      "Standard_E64_V3", "Standard_E64i_V3", "Standard_E2s_V3", "Standard_E4s_V3", "Standard_E8s_V3", "Standard_E16s_V3",
      "Standard_E20s_V3", "Standard_E32s_V3", "Standard_E64s_V3", "Standard_E64is_V3", "Standard_D2a_V4", "Standard_D4a_V4",
      "Standard_D8a_V4", "Standard_D16a_V4", "Standard_D32a_V4", "Standard_D48a_V4", "Standard_D64a_V4", "Standard_D96a_V4",
      "Standard_E2a_V4", "Standard_E4a_V4", "Standard_E8a_V4", "Standard_E16a_V4", "Standard_E20a_V4", "Standard_E32a_V4",
      "Standard_E48a_V4", "Standard_E64a_V4", "Standard_E96a_V4", "Standard_D2ads_V5", "Standard_D4ads_V5", "Standard_D8ads_V5",
      "Standard_D16ads_V5", "Standard_D32ads_V5", "Standard_D48ads_V5", "Standard_D64ads_V5", "Standard_D96ads_V5",
      "Standard_E2ads_V5", "Standard_E4ads_V5", "Standard_E8ads_V5", "Standard_E16ads_V5", "Standard_E20ads_V5",
      "Standard_E32ads_V5", "Standard_E48ads_V5", "Standard_E64ads_V5", "Standard_E96ads_V5", "Standard_D2ads_V5",
      "Standard_D4ads_V5", "Standard_D8ads_V5", "Standard_D16ads_V5", "Standard_D32ads_V5", "Standard_D48ads_V5",
      "Standard_D64ads_V5", "Standard_D96ads_V5", "Standard_E2ads_V5", "Standard_E4ads_V5", "Standard_E8ads_V5",
      "Standard_E16ads_V5", "Standard_E20ads_V5", "Standard_E32ads_V5", "Standard_E48ads_V5", "Standard_E64ads_V5",
      "Standard_E96ads_V5", "Standard_G1", "Standard_G2", "Standard_G3", "Standard_G4", "Standard_G5", "Standard_F2s_V2",
      "Standard_F4s_V2", "Standard_F8s_V2", "Standard_F16s_V2", "Standard_F32s_V2", "Standard_F64s_V2", "Standard_F72s_V2",
    "Standard_GS1", "Standard_GS2", "Standard_GS3", "Standard_GS4", "Standard_GS5", "Standard_NC24"], var.head_node_vm_size)
    error_message = "The only allowed values are 'ExtraSmall', 'Small', 'Medium', 'Large', 'ExtraLarge', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'Standard_A1_V2', 'Standard_A2_V2', 'Standard_A2m_V2', 'Standard_A3', 'Standard_A4_V2', 'Standard_A4m_V2', 'Standard_A8_V2', 'Standard_A8m_V2', 'Standard_D1', 'Standard_D2', 'Standard_D3', 'Standard_D4', 'Standard_D11', 'Standard_D12', 'Standard_D13', 'Standard_D14', 'Standard_D1_V2', 'Standard_D2_V2', 'Standard_D3_V2', 'Standard_D4_V2', 'Standard_D5_V2', 'Standard_D11_V2', 'Standard_D12_V2', 'Standard_D13_V2', 'Standard_D14_V2', 'Standard_DS1_V2', 'Standard_DS2_V2', 'Standard_DS3_V2', 'Standard_DS4_V2', 'Standard_DS5_V2', 'Standard_DS11_V2', 'Standard_DS12_V2', 'Standard_DS13_V2', 'Standard_DS14_V2', 'Standard_E2_V3', 'Standard_E4_V3', 'Standard_E8_V3', 'Standard_E16_V3', 'Standard_E20_V3', 'Standard_E32_V3', 'Standard_E64_V3', 'Standard_E64i_V3', 'Standard_E2s_V3', 'Standard_E4s_V3', 'Standard_E8s_V3', 'Standard_E16s_V3', 'Standard_E20s_V3', 'Standard_E32s_V3', 'Standard_E64s_V3', 'Standard_E64is_V3', 'Standard_D2a_V4', 'Standard_D4a_V4', 'Standard_D8a_V4', 'Standard_D16a_V4', 'Standard_D32a_V4', 'Standard_D48a_V4', 'Standard_D64a_V4', 'Standard_D96a_V4', 'Standard_E2a_V4', 'Standard_E4a_V4', 'Standard_E8a_V4', 'Standard_E16a_V4', 'Standard_E20a_V4', 'Standard_E32a_V4', 'Standard_E48a_V4', 'Standard_E64a_V4', 'Standard_E96a_V4', 'Standard_D2ads_V5', 'Standard_D4ads_V5', 'Standard_D8ads_V5', 'Standard_D16ads_V5', 'Standard_D32ads_V5', 'Standard_D48ads_V5', 'Standard_D64ads_V5', 'Standard_D96ads_V5', 'Standard_E2ads_V5', 'Standard_E4ads_V5', 'Standard_E8ads_V5', 'Standard_E16ads_V5', 'Standard_E20ads_V5', 'Standard_E32ads_V5', 'Standard_E48ads_V5', 'Standard_E64ads_V5', 'Standard_E96ads_V5', 'Standard_G1', 'Standard_G2', 'Standard_G3', 'Standard_G4', 'Standard_G5', 'Standard_F2s_V2', 'Standard_F4s_V2', 'Standard_F8s_V2', 'Standard_F16s_V2', 'Standard_F32s_V2', 'Standard_F64s_V2', 'Standard_F72s_V2', 'Standard_GS1', 'Standard_GS2', 'Standard_GS3', 'Standard_GS4', 'Standard_GS5', 'Standard_NC24'."
  }
}

variable "worker_node_vm_size" {
  description = "The Size of the Virtual Machine which should be used as the Worker Nodes."
  type        = string
  validation {
    condition = contains([
      "ExtraSmall", "Small", "Medium", "Large", "ExtraLarge", "A5", "A6", "A7", "A8", "A9", "A10", "A11",
      "Standard_A1_V2", "Standard_A2_V2", "Standard_A2m_V2", "Standard_A3", "Standard_A4_V2", "Standard_A4m_V2",
      "Standard_A8_V2", "Standard_A8m_V2", "Standard_D1", "Standard_D2", "Standard_D3", "Standard_D4",
      "Standard_D11", "Standard_D12", "Standard_D13", "Standard_D14", "Standard_D1_V2", "Standard_D2_V2",
      "Standard_D3_V2", "Standard_D4_V2", "Standard_D5_V2", "Standard_D11_V2", "Standard_D12_V2", "Standard_D13_V2",
      "Standard_D14_V2", "Standard_DS1_V2", "Standard_DS2_V2", "Standard_DS3_V2", "Standard_DS4_V2", "Standard_DS5_V2",
      "Standard_DS11_V2", "Standard_DS12_V2", "Standard_DS13_V2", "Standard_DS14_V2", "Standard_E2_V3",
      "Standard_E4_V3", "Standard_E8_V3", "Standard_E16_V3", "Standard_E20_V3", "Standard_E32_V3",
      "Standard_E64_V3", "Standard_E64i_V3", "Standard_E2s_V3", "Standard_E4s_V3", "Standard_E8s_V3",
      "Standard_E16s_V3", "Standard_E20s_V3", "Standard_E32s_V3", "Standard_E64s_V3", "Standard_E64is_V3",
      "Standard_D2a_V4", "Standard_D4a_V4", "Standard_D8a_V4", "Standard_D16a_V4", "Standard_D32a_V4",
      "Standard_D48a_V4", "Standard_D64a_V4", "Standard_D96a_V4", "Standard_E2a_V4", "Standard_E4a_V4",
      "Standard_E8a_V4", "Standard_E16a_V4", "Standard_E20a_V4", "Standard_E32a_V4", "Standard_E48a_V4",
      "Standard_E64a_V4", "Standard_E96a_V4", "Standard_D2ads_V5", "Standard_D64ads_V5", "Standard_D96ads_V5",
      "Standard_E2ads_V5", "Standard_E4ads_V5", "Standard_E8ads_V5", "Standard_E16ads_V5", "Standard_E20ads_V5",
      "Standard_E32ads_V5", "Standard_E48ads_V5", "Standard_E64ads_V5", "Standard_E96ads_V5", "Standard_G1",
      "Standard_G2", "Standard_G3", "Standard_G4", "Standard_G5", "Standard_F2s_V2", "Standard_F4s_V2",
      "Standard_F8s_V2", "Standard_F16s_V2", "Standard_F32s_V2", "Standard_F64s_V2", "Standard_F72s_V2",
    "Standard_GS1", "Standard_GS2", "Standard_GS3", "Standard_GS4", "Standard_GS5", "Standard_NC24"], var.worker_node_vm_size)
    error_message = "The only allowed values are 'ExtraSmall', 'Small', 'Medium', 'Large', 'ExtraLarge', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'Standard_A1_V2', 'Standard_A2_V2', 'Standard_A2m_V2', 'Standard_A3', 'Standard_A4_V2', 'Standard_A4m_V2', 'Standard_A8_V2', 'Standard_A8m_V2', 'Standard_D1', 'Standard_D2', 'Standard_D3', 'Standard_D4', 'Standard_D11', 'Standard_D12', 'Standard_D13', 'Standard_D14', 'Standard_D1_V2', 'Standard_D2_V2', 'Standard_D3_V2', 'Standard_D4_V2', 'Standard_D5_V2', 'Standard_D11_V2', 'Standard_D12_V2', 'Standard_D13_V2', 'Standard_D14_V2', 'Standard_DS1_V2', 'Standard_DS2_V2', 'Standard_DS3_V2', 'Standard_DS4_V2', 'Standard_DS5_V2', 'Standard_DS11_V2', 'Standard_DS12_V2', 'Standard_DS13_V2', 'Standard_DS14_V2', 'Standard_E2_V3', 'Standard_E4_V3', 'Standard_E8_V3', 'Standard_E16_V3', 'Standard_E20_V3', 'Standard_E32_V3', 'Standard_E64_V3', 'Standard_E64i_V3', 'Standard_E2s_V3', 'Standard_E4s_V3', 'Standard_E8s_V3', 'Standard_E16s_V3', 'Standard_E20s_V3', 'Standard_E32s_V3', 'Standard_E64s_V3', 'Standard_E64is_V3', 'Standard_D2a_V4', 'Standard_D4a_V4', 'Standard_D8a_V4', 'Standard_D16a_V4', 'Standard_D32a_V4', 'Standard_D48a_V4', 'Standard_D64a_V4', 'Standard_D96a_V4', 'Standard_E2a_V4', 'Standard_E4a_V4', 'Standard_E8a_V4', 'Standard_E16a_V4', 'Standard_E20a_V4', 'Standard_E32a_V4', 'Standard_E48a_V4', 'Standard_E64a_V4', 'Standard_E96a_V4', 'Standard_D2ads_V5', 'Standard_D64ads_V5', 'Standard_D96ads_V5', 'Standard_E2ads_V5', 'Standard_E4ads_V5', 'Standard_E8ads_V5', 'Standard_E16ads_V5', 'Standard_E20ads_V5', 'Standard_E32ads_V5', 'Standard_E48ads_V5', 'Standard_E64ads_V5', 'Standard_E96ads_V5', 'Standard_G1', 'Standard_G2', 'Standard_G3', 'Standard_G4', 'Standard_G5', 'Standard_F2s_V2', 'Standard_F4s_V2', 'Standard_F8s_V2', 'Standard_F16s_V2', 'Standard_F32s_V2', 'Standard_F64s_V2', 'Standard_F72s_V2', 'Standard_GS1', 'Standard_GS2', 'Standard_GS3', 'Standard_GS4', 'Standard_GS5', 'Standard_NC24'."
  }
}


variable "zookeeper_node_vm_size" {
  description = "The Size of the Virtual Machine which should be used as the Zookeeper Nodes."
  type        = string
  validation {
    condition = contains([
      "ExtraSmall", "Small", "Medium", "Large", "ExtraLarge", "A5", "A6", "A7", "A8", "A9", "A10", "A11",
      "Standard_A1_V2", "Standard_A2_V2", "Standard_A2m_V2", "Standard_A3", "Standard_A4_V2", "Standard_A4m_V2",
      "Standard_A8_V2", "Standard_A8m_V2", "Standard_D1", "Standard_D2", "Standard_D3", "Standard_D4",
      "Standard_D11", "Standard_D12", "Standard_D13", "Standard_D14", "Standard_D1_V2", "Standard_D2_V2",
      "Standard_D3_V2", "Standard_D4_V2", "Standard_D5_V2", "Standard_D11_V2", "Standard_D12_V2", "Standard_D13_V2",
      "Standard_D14_V2", "Standard_DS1_V2", "Standard_DS2_V2", "Standard_DS3_V2", "Standard_DS4_V2", "Standard_DS5_V2",
      "Standard_DS11_V2", "Standard_DS12_V2", "Standard_DS13_V2", "Standard_DS14_V2", "Standard_E2_V3",
      "Standard_E4_V3", "Standard_E8_V3", "Standard_E16_V3", "Standard_E20_V3", "Standard_E32_V3",
      "Standard_E64_V3", "Standard_E64i_V3", "Standard_E2s_V3", "Standard_E4s_V3", "Standard_E8s_V3",
      "Standard_E16s_V3", "Standard_E20s_V3", "Standard_E32s_V3", "Standard_E64s_V3", "Standard_E64is_V3",
      "Standard_D2a_V4", "Standard_D4a_V4", "Standard_D8a_V4", "Standard_D16a_V4", "Standard_D32a_V4",
      "Standard_D48a_V4", "Standard_D64a_V4", "Standard_D96a_V4", "Standard_E2a_V4", "Standard_E4a_V4",
      "Standard_E8a_V4", "Standard_E16a_V4", "Standard_E20a_V4", "Standard_E32a_V4", "Standard_E48a_V4",
      "Standard_E64a_V4", "Standard_E96a_V4", "Standard_D2ads_V5", "Standard_D64ads_V5", "Standard_D96ads_V5",
      "Standard_E2ads_V5", "Standard_E4ads_V5", "Standard_E8ads_V5", "Standard_E16ads_V5", "Standard_E20ads_V5",
      "Standard_E32ads_V5", "Standard_E48ads_V5", "Standard_E64ads_V5", "Standard_E96ads_V5", "Standard_G1",
      "Standard_G2", "Standard_G3", "Standard_G4", "Standard_G5", "Standard_F2s_V2", "Standard_F4s_V2",
      "Standard_F8s_V2", "Standard_F16s_V2", "Standard_F32s_V2", "Standard_F64s_V2", "Standard_F72s_V2",
    "Standard_GS1", "Standard_GS2", "Standard_GS3", "Standard_GS4", "Standard_GS5", "Standard_NC24"], var.zookeeper_node_vm_size)
    error_message = "The only allowed values are 'ExtraSmall', 'Small', 'Medium', 'Large', 'ExtraLarge', 'A5', 'A6', 'A7', 'A8', 'A9', 'A10', 'A11', 'Standard_A1_V2', 'Standard_A2_V2', 'Standard_A2m_V2', 'Standard_A3', 'Standard_A4_V2', 'Standard_A4m_V2', 'Standard_A8_V2', 'Standard_A8m_V2', 'Standard_D1', 'Standard_D2', 'Standard_D3', 'Standard_D4', 'Standard_D11', 'Standard_D12', 'Standard_D13', 'Standard_D14', 'Standard_D1_V2', 'Standard_D2_V2', 'Standard_D3_V2', 'Standard_D4_V2', 'Standard_D5_V2', 'Standard_D11_V2', 'Standard_D12_V2', 'Standard_D13_V2', 'Standard_D14_V2', 'Standard_DS1_V2', 'Standard_DS2_V2', 'Standard_DS3_V2', 'Standard_DS4_V2', 'Standard_DS5_V2', 'Standard_DS11_V2', 'Standard_DS12_V2', 'Standard_DS13_V2', 'Standard_DS14_V2', 'Standard_E2_V3', 'Standard_E4_V3', 'Standard_E8_V3', 'Standard_E16_V3', 'Standard_E20_V3', 'Standard_E32_V3', 'Standard_E64_V3', 'Standard_E64i_V3', 'Standard_E2s_V3', 'Standard_E4s_V3', 'Standard_E8s_V3', 'Standard_E16s_V3', 'Standard_E20s_V3', 'Standard_E32s_V3', 'Standard_E64s_V3', 'Standard_E64is_V3', 'Standard_D2a_V4', 'Standard_D4a_V4', 'Standard_D8a_V4', 'Standard_D16a_V4', 'Standard_D32a_V4', 'Standard_D48a_V4', 'Standard_D64a_V4', 'Standard_D96a_V4', 'Standard_E2a_V4', 'Standard_E4a_V4', 'Standard_E8a_V4', 'Standard_E16a_V4', 'Standard_E20a_V4', 'Standard_E32a_V4', 'Standard_E48a_V4', 'Standard_E64a_V4', 'Standard_E96a_V4', 'Standard_D2ads_V5', 'Standard_D64ads_V5', 'Standard_D96ads_V5', 'Standard_E2ads_V5', 'Standard_E4ads_V5', 'Standard_E8ads_V5', 'Standard_E16ads_V5', 'Standard_E20ads_V5', 'Standard_E32ads_V5', 'Standard_E48ads_V5', 'Standard_E64ads_V5', 'Standard_E96ads_V5', 'Standard_G1', 'Standard_G2', 'Standard_G3', 'Standard_G4', 'Standard_G5', 'Standard_F2s_V2', 'Standard_F4s_V2', 'Standard_F8s_V2', 'Standard_F16s_V2', 'Standard_F32s_V2', 'Standard_F64s_V2', 'Standard_F72s_V2', 'Standard_GS1', 'Standard_GS2', 'Standard_GS3', 'Standard_GS4', 'Standard_GS5', 'Standard_NC24'."
  }
}

variable "virtual_network_id" {
  description = "The ID of the virtual network."
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet within the virtual network to which the cluster should be connected."
  type        = string
}

variable "worker_node_instance_count" {
  description = "The number of instances which should be run for the Worker Nodes."
  type        = number
  default     = 1
}

variable "network_connection_direction" {
  description = "The direction of the resource provider connection. Possible values include Inbound or Outbound. Defaults to Inbound."
  type        = string
  default     = "Inbound"
  validation {
    condition     = contains(["Inbound", "Outbound"], var.network_connection_direction)
    error_message = "The only possible values are 'Inbound' or 'Outbound'."
  }
}

variable "network_private_link_enabled" {
  description = "Boolean flag to specify whether the private link is enabled. Possible values include true or false. Defaults to false."
  type        = bool
  default     = false
  validation {
    condition     = var.network_private_link_enabled == true || var.network_connection_direction == "Outbound"
    error_message = "If 'network_private_link_enabled' is true, 'network_connection_direction' must be set to 'Outbound'."
  }
}

#Data variables
variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}
/*
variable "private_link_configuration_group_id" {
  description = "The HDInsight private linkable sub-resource name to apply the private link configuration to. For example, 'headnode', 'gateway', 'edgenode'."
  type        = string
  default     = "headnode"
  validation {
    condition     = contains(["headnode", "gateway", "edgenode"], var.private_link_configuration_group_id)
    error_message = "The only allowed values are 'headnode', 'gateway', or 'edgenode'."
  }
}

variable "private_link_service_connection_primary" {
  description = "Whether the private link service connection is primary"
  type        = bool
  default     = true
}

variable "private_link_service_connection_private_ip_allocation_method" {
  description = "The private IP allocation method for the private link service connection"
  type        = string
  default     = "Dynamic"
}









#Local Varaiables
variable "nsg_association_subnet_name" {
  description = "The name of the subnet to associate with the NSG."
  type        = string
}

variable "nsg_association_vnet_name" {
  description = "The name of the virtual network to associate with the NSG."
  type        = string
}*/