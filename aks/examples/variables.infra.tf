variable "mgmt_sub_id" {
  description = "the mgmt subcription id for where the private dns zones reside"
  default     = "000bdcc8-114c-418a-ad9d-a1ac486ac658"
  type        = string
}


variable "tenant_id" {
  description = "tenant id where the subscription to deploy the aks cluster is"
  default     = "72b17115-9915-42c0-9f1b-4f98e5a4bcd2"
  type        = string
}

variable "private_dns_rg" {
  description = "private dns zone resource group"
  default     = "rg-dns_infrastructure"
  type        = string
}
