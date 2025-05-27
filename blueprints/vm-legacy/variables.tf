variable "subscription_id" {
  description = "subscription to use"
  type        = string
}

variable "env" {
  description = "environment - dev, test, prod"
  type        = string
}

variable "resource_group_name" {
  description = "name of the resource group where to place the vm"
  type        = string
}

variable "vm_name_token" {
  description = "name for the vm that addtional context will be added to"
  type        = string
}

variable "vm_name" {
  description = "full name of the vm, overrides vm_name_token"
  type        = string
  default     = null
}

variable "incr" {
  description = "the increment/number of the vm"
  type        = string
  default     = "01"
}

variable "vm_size" {
  description = "sku of the vm size reference url: https://learn.microsoft.com/en-us/azure/virtual-machines/sizes"
  type        = string
}

variable "vm_admin_user" {
  description = "admin user of the vm"
  type        = string
  default     = "root"
}

variable "vm_admin_pwd_keyvault_rg" {
  description = "Resource Group for the Kevault secret holding the vm admin password"
  type        = string
  default     = null
}

variable "vm_admin_pwd_keyvault_name" {
  description = "keyvault name for the vm admin password"
  type        = string
}

variable "vm_admin_pwd_keyvault_secret_name" {
  description = "keyvault secret name for the vm admin password"
  type        = string
}

variable "nic" {
  description = "vm network interface(s)"
  type = map(object({
    rg                   = string,
    location             = string,
    enable_ip_forwarding = bool,
    subnet_id            = string,
    name                 = string,
    private_ip_address   = string,
    primary              = bool,
  }))
}

variable "os_disk" {
  description = "os disk info"
  type = object({
    caching              = string,
    storage_account_type = string,
    disk_size_gb         = number
  })
}

variable "source_image_reference" {
  description = "source image reference: https://documentation.ubuntu.com/azure/en/latest/azure-how-to/instances/find-ubuntu-images/"
  type = object({
    publisher = string,
    offer     = string,
    sku       = string,
    version   = string,
  })
}

variable "nic_rg" {
  description = "resource group name for network interface"
  type        = string
}

variable "nic_vnet" {
  description = "vnet for network interface"
  type        = string
}

variable "nic_subnet_name" {
  description = "subnet name for network interface"
  type        = string
}

