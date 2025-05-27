variable "name" {
  description = "The name of the management lock."
  type        = string
}

variable "scope" {
  description = "The scope of the management lock."
  type        = string
}

variable "lock_level" {
  description = "The level of the management lock."
  type        = string
  default     = "CanNotDelete"
}

variable "notes" {
  description = "Notes about the management lock."
  type        = string
  default     = "Locked because it's needed by a third-party"
}