variable "group_owners" {
  description = "list of owner email addresses"
  type        = list(string)
}

variable "group_name" {
  description = "the name of the group to create"
  type        = string
  validation {
    condition     = length(var.group_name) > 3
    error_message = "the group name must be at least 4 characters in length"
  }
}
