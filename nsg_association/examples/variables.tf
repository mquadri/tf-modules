variable "nsg_association" {
  type = map(object({
    nsg_name                 = string
    nsg_resource_group       = string
    subnet_name              = string
    vnet_name                = string
    vnet_resource_group_name = string
  }))
  default     = {}
  description = "Associates NSGs with subnet"
}
