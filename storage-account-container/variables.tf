variable "storage_container_name" {
  type        = string
  description = "The name of the Container which should be created within the Storage Account."
}

variable "storage_account_name" {
  type        = string
  description = "The name of the Storage Account where the Container should be created."
}

variable "container_access_type" {
  type        = string
  description = "The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private."
  default     = "private"
}