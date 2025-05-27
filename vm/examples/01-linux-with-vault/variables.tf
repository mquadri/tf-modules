variable "tf_team_group" {
  description = "List of User Ids for the Terraform Team"
  type        = list(string)
}

resource "validation_warning" "tf_team_group" {
  condition = var.tf_team_group != null
  summary   = "WARNING: Deprecation Notice, tf_team_group is not loger used, please remove this variable from your configuration"
}

variable "vm_cluster_admin_group" {
  description = "Group name for the VM Admins"
  type        = string
}

variable "vm_cluster_user_group" {
  description = "Group name for the VM Users"
  type        = string
}

variable "vm_rbac_admin_group" {
  description = "Group name for the VM Admins"
  type        = string
}

variable "vm_rbac_reader_group" {
  description = "Group name for the VM Readers"
  type        = string
}

variable "vm_rbac_writer_group" {
  description = "Group name for the AKS RBAC Writers"
  type        = string
}