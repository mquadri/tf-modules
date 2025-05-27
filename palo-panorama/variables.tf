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

variable "enable_zones" {
  description = "If false, the input `avzone` is ignored and all created public IPs default not to use Availability Zones (the `No-Zone` setting). It is intended for the regions that do not yet support Availability Zones."
  default     = true
  type        = bool
}

variable "avzone" {
  description = "The availability zone to use, for example \"1\", \"2\", \"3\". Ignored if `enable_zones` is false. Use `avzone = null` to disable the use of Availability Zones."
  default     = null
}

variable "avzones" {
  description = <<-EOF
  After provider version 3.x you need to specify in which availability zone(s) you want to place IP.
  ie: for zone-redundant with 3 availability zone in current region value will be:
  ```["1","2","3"]```
  EOF
  default     = []
  type        = list(string)
}

variable "vnet_name" {
  description = "name of the vnet where the vm's will be deployed to"
  type        = string
}

variable "vnet_resource_group_name" {
  description = "name of the resource group where the vnet resides"
  type        = string
}

variable "subnet_id" {
  description = "subnet id where the interfaces will reside"
  type        = string
}

variable "os_disk_name" {
  description = "The name of OS disk. The name is auto-generated when not provided."
  default     = null
  type        = string
}
variable "resource_group_name" {
  description = "The name of the existing resource group where to place all the resources created by this module."
  type        = string
}

# Instance settings
variable "panorama_size" {
  description = "Virtual Machine size."
  default     = "Standard_D5_v2"
}

variable "username" {
  description = "Initial administrative username to use for Panorama. Mind the [Azure-imposed restrictions](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-username-requirements-when-creating-a-vm)."
  default     = "panadmin"
  type        = string
}

variable "password" {
  description = "Initial administrative password to use for Panorama. If not defined the `ssh_key` variable must be specified. Mind the [Azure-imposed restrictions](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-password-requirements-when-creating-a-vm)."
  default     = null
  type        = string
  sensitive   = true
}

variable "ssh_keys" {
  description = <<-EOF
  A list of initial administrative SSH public keys that allow key-pair authentication.
  
  This is a list of strings, so each item should be the actual public key value. If you would like to load them from files instead, following method is available:

  ```
  [
    file("/path/to/public/keys/key_1.pub"),
    file("/path/to/public/keys/key_2.pub")
  ]
  ```
  
  If the `password` variable is also set, VM-Series will accept both authentication methods.
  EOF
  default     = []
  type        = list(string)
}

variable "enable_plan" {
  description = "Enable usage of the Offer/Plan on Azure Marketplace. Even plan sku \"byol\", which means \"bring your own license\", still requires accepting on the Marketplace (as of 2021). Can be set to `false` when using a custom image."
  default     = true
  type        = bool
}

variable "panorama_disk_type" {
  description = "Specifies the type of managed disk to create. Possible values are either Standard_LRS, StandardSSD_LRS, Premium_LRS or UltraSSD_LRS."
  default     = "StandardSSD_LRS"
  type        = string

  validation {
    condition     = contains(["Standard_LRS", "StandardSSD_LRS", "Premium_LRS", "UltraSSD_LRS"], var.panorama_disk_type)
    error_message = "Panorama disk type need to be one of list Standard_LR, StandardSSD_LRS, Premium_LRS, UltraSSD_LRS."
  }
}

variable "panorama_sku" {
  description = "Panorama SKU."
  default     = "byol"
  type        = string
}

variable "panorama_version" {
  description = "Panorama PAN-OS Software version. List published images with `az vm image list -o table --all --publisher paloaltonetworks --offer panorama`"
  default     = "10.0.3"
  type        = string
}

variable "panorama_publisher" {
  description = "Panorama Publisher."
  default     = "paloaltonetworks"
  type        = string
}

variable "panorama_offer" {
  description = "Panorama offer."
  default     = "panorama"
  type        = string
}

variable "custom_image_id" {
  description = "Absolute ID of your own Custom Image to be used for creating Panorama. If set, the `username`, `password`, `panorama_version`, `panorama_publisher`, `panorama_offer`, `panorama_sku` inputs are all ignored (these are used only for published images, not custom ones). The Custom Image is expected to contain PAN-OS software."
  default     = null
  type        = string
}

# Networking


# Storage
variable "logging_disks" {
  description = <<-EOF
   A map of objects describing the additional disk configuration. The keys of the map are the names and values are { size, zone, lun }. 
   The size value is provided in GB. The recommended size for additional (optional) disks is at least 2TB (2048 GB). Example:

  ```
  {
    logs-1 = {
      size: "2048"
      zone: "1"
      lun: "1"
    }
    logs-2 = {
      size: "2048"
      zone: "2"
      lun: "2"
      disk_type: "StandardSSD_LRS"
    }
  }
  ```

  EOF
  default     = {}
  type        = map(any)
}


variable "boot_diagnostic_storage_uri" {
  description = "Existing diagnostic storage uri"
  default     = null
  type        = string
}

variable "tags" {
  description = "A map of tags to be associated with the resources created."
  default     = {}
  type        = map(any)
}