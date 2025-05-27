variable "topics" {
  description = "List of topics for referencing the repository"
  default     = ["tf-modules-azure"]
}

variable "token" {
  description = "GitHub token"
  default     = "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"

}

variable "visibility" {
  description = "GitHub visibility"
  default     = "internal"

}

variable "owner" {
  description = "value for the owner of the repository"
  default     = "CenturyLink"

}