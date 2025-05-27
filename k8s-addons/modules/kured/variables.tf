variable "cluster_name" {
  description = "the aks cluster name"
  type        = string
}

variable "cluster_rg" {
  description = "the aks cluster resource group"
  type        = string
}

variable "registry_username" {
  description = "the registry username"
  type        = string
}

variable "registry_secret" {
  description = "the registry secret"
  type        = string
}

variable "registry_server" {
  description = "the registry server"
}

variable "imgpullsecret" {
  description = "kured image pull secret name"
}

variable "kured_imgrepository" {
  description = "kured image repository url"
  default     = "ghcr.io/kubereboot/kured"
}

variable "kured_imgtag" {
  description = "kured image tag"
}

variable "kured_imgpullpolicy" {
  description = "kured image pull policy"
}

variable "kured_namespace" {
  description = "kured aks deployment namespace"
}

variable "kured_timezone" {
  description = "kured aks timezone"
}

variable "kured_starttime" {
  description = "kured aks starting time"
  default     = null
}

variable "kured_endtime" {
  description = "kured aks end time"
  default     = null
}

variable "kured_period" {
  description = "reboot check period (default 1h0m0s)"
  default     = null
}

variable "kured_rebootdays" {
  description = "reboot days"
  default     = null
  type        = list(string)
}

variable "kured_namespace_labels" {
  description = "the kured namespace labels"
}