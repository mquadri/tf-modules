## Naming and Tags ##
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
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

variable "resource_group_name" {
  description = "Resource group name for where databrocks will be deployed"
  type        = string
}

variable "pe_subnet_name" {
  description = "subnet name for private endpoint subnet"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "resource group name where to deploy Databricks"
  type        = string
}

variable "vnet_name" {
  description = "name of the vnet to deploy databricks to"
  type        = string
}

variable "userIdentities" {
  description = "When using managed identity, the user identities that will be assigned to the data factory"
  type        = list(string)
  default     = []
}

variable "key_vault_name" {
  description = "The name of the key vault where the customer managed key is stored"
  type        = string
}

variable "key_vault_resource_group_name" {
  description = "The resource group name of the key vault where the customer managed key is stored"
  type        = string
}

variable "private_dns_zone_name" {
  description = "The name of the private dns zone to link to the data factory private endpoint"
  type        = string
  default     = "privatelink.datafactory.azure.net"
}

variable "private_dns_portal_zone_name" {
  description = "The name of the private dns zone to link to the data factory private endpoint for portal"
  type        = string
  default     = "privatelink.adf.azure.com"
}

variable "private_dns_rg" {
  description = "The resource group name of the private dns zone to link to the data factory private endpoint"
  type        = string
}

variable "github_configuration" {
  description = "Github configuration for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#github_configuration"
  type = map(
    object({
      branch_name        = string
      repository_name    = string
      publishing_enabled = optional(bool, null)
      root_folder        = string
    })
  )
  default = null
}

variable "global_parameters" {
  description = "Global parameters for data factory. See documentation at https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/data_factory#global_parameter"
  type = list(map(
    object({
      name  = string
      type  = string
      value = string
    })
  ))
  default = []
}

variable "integration_runtime_description" {
  description = "Description of the integration runtime"
  type        = string
  default     = "Runtime for data factory"
}

variable "download_shir_uri" {
  description = "The download link for the self hosted integration runtime"
  type        = string
  default     = "https://download.microsoft.com/download/E/4/7/E4771905-1079-445B-8BF9-8A1A075D8A10/IntegrationRuntime_5.42.8912.1.msi"
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
  default     = ""
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  default     = ""
}

variable "machine_creds_akv_name" {
  description = "The name of the key vault where the machine credentials are stored"
  type        = string
  default     = ""
}

variable "machine_creds_akv_rg" {
  description = "The resource group name of the key vault where the machine credentials are stored"
  type        = string
  default     = ""
}

variable "ultra_ssd_enabled" {
  description = "Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine."
  type        = bool
  default     = false
}

variable "availability_zone" {
  description = "The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "main_subnet_name" {
  description = "value of the main subnet name for the SHIR"
  type        = string

}


variable "storage_analytics_name" {
  description = "The Storage Account's Blob Name which should hold the virtual machine's diagnostic files. If null it will use managed ones"
  type        = string
  default     = null
}

variable "resource_group_storage_name" {
  description = "The Storage Account's resurce name. Defaault to deployment resource group"
  type        = string
  default     = null
}

# VM Control Variables
variable "total_machine_count" {
  description = "Number of VMs to be provisioned"
  type        = number
  default     = 1
}

variable "accelerated_networking" {
  description = "Enable accelerated networking?"
  type        = bool
  default     = false
}

variable "virtual_machine_size" {
  description = "Instance size to be provisioned"
  type        = string
  default     = "Standard_D4s_v4"
}


variable "source_image_publisher" {
  description = "Operating System Publisher"
  type        = string
  default     = "MicrosoftWindowsServer"
}

variable "source_image_offer" {
  description = "Operating System Name"
  type        = string
  default     = "WindowsServer"
}

variable "source_image_sku" {
  description = "Operating System SKU"
  type        = string
  default     = "2019-Datacenter"
}

variable "source_image_version" {
  description = "Operating System Version"
  type        = string
  default     = "latest"
}

# Operating System Disck
variable "operating_system_disk_cache" {
  description = "Type of caching to use on the OS disk - Options: None, ReadOnly or ReadWrite"
  type        = string
  default     = "ReadWrite"

  validation {
    condition     = (contains(["none", "readonly", "readwrite"], lower(var.operating_system_disk_cache)))
    error_message = "OS Disk cache can only be \"None\", \"ReadOnly\" or \"ReadWrite\"."
  }
}

variable "operating_system_disk_type" {
  description = "Type of storage account to use with the OS disk - Options: Standard_LRS, StandardSSD_LRS or Premium_LRS"
  type        = string
  default     = "StandardSSD_LRS"

  validation {
    condition     = (contains(["standard_lrs", "standardssd_lrs", "premium_lrs", "ultrassd_lrs"], lower(var.operating_system_disk_type)))
    error_message = "Public IP sku can only be \"Standard_LRS\", \"StandardSSD_LRS\", \"Premium_LRS\" or \"UltraSSD_LRS\"."
  }
}

variable "operating_system_disk_write_accelerator" {
  description = "Should Write Accelerator be Enabled for this OS Disk?"
  type        = bool
  default     = false
}

variable "enable_boot_diagnostics" {
  description = "Whether to enable boot diagnostics on the virtual machine."
  type        = bool
  default     = true
}


variable "data_disk_create_option" {
  description = "the Create Option of the Data Disk, such as Empty or Attach. Defaults to Attach. Changing this forces a new resource to be created."
  type        = string
  default     = "Empty"

  validation {
    condition     = (contains(["empty", "attach"], lower(var.data_disk_create_option)))
    error_message = "Data Dosk Create Option only be \"Empty\" or \"Attach\"."
  }
}


variable "data_disk_size_gb" {
  description = "The data size of disk to be create"
  type        = number
  default     = 256
}

variable "data_disk_enabled" {
  description = "Create and attach a data disk?"
  type        = bool
  default     = false
}

variable "data_disk_machine_lun" {
  description = "The Logical Unit Number of the Data Disk. Changing this forces a new resource to be created."
  type        = string
  default     = "0"
}

variable "data_disk_caching" {
  description = "The Caching of the Data Disk. Possible values are None, ReadOnly, ReadWrite. Changing this forces a new resource to be created."
  type        = string
  default     = "None"

  validation {
    condition     = (contains(["none", "readonly", "readwrite"], lower(var.data_disk_caching)))
    error_message = "OS Disk cache can only be \"None\", \"ReadOnly\" or \"ReadWrite\"."
  }
}

variable "data_disk_type" {
  description = "Type of storage account to use with the Data disk - Options: Standard_LRS, StandardSSD_LRS or Premium_LRS"
  type        = string
  default     = "Premium_LRS"

  validation {
    condition     = (contains(["standard_lrs", "standardssd_lrs", "premium_lrs", "ultrassd_lrs"], lower(var.data_disk_type)))
    error_message = "Public IP sku can only be \"Standard_LRS\", \"StandardSSD_LRS\", \"Premium_LRS\" or \"UltraSSD_LRS\"."
  }
}

variable "recovery_sku" {
  description = "The recovery services vault SKU to use"
  type        = string
  default     = "Standard"
}

variable "adf_portal_enabled" {
  description = "Enable the Azure Data Factory portal"
  type        = bool
  default     = false

}

variable "akv_linked_id" {
  description = "The id of key vault to link to the data factory"
  type        = string
  default     = null
}

variable "akv_linked_id_enabled" {
  description = "Enable the key vault linked service, defaults to true"
  type        = bool
  default     = true
}

variable "sa_datalake_linkedNames" {
  description = "The names of the storage accounts to link to the data factory"
  type        = list(string)
  default     = []
}

variable "sql_linked_service" {
  description = "either to deploy a linked service to a sql server or not"
  type        = bool
  default     = false
}

variable "sql_secret_name" {
  description = "The name of the secret in the key vault to link to the data factory"
  type        = string
}

variable "connection_string" {
  description = "The connection string to the sql server"
  type        = string
  default     = null
}

variable "sql_server_user" {
  description = "The username for the sql server"
  type        = string
  default     = null
}

variable "sql_server_url" {
  description = "The url for the sql server"
  type        = string
  default     = null
}

variable "sql_server_name" {
  description = "The name of the sql server"
  type        = string
  default     = null
}

variable "sql_db_name" {
  description = "The name of the sql server database"
  type        = string
  default     = null
}

variable "akv_policies_deploy" {
  description = "Either to deploy the key vault policies or not"
  type        = bool
  default     = false
}

variable "adf_high_availability_port" {
  description = "The port for the high availability endpoint"
  type        = string
  default     = "8060"
}

variable "mi_connection_string" {
  description = "The managed identity connection string to the sql database"
  type        = string
  default     = null
}

variable "sql_mi_linked_service" {
  description = "either to deploy a linked service to a sql database or not"
  type        = bool
  default     = false
}
