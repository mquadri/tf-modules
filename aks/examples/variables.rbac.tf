#rbac
variable "tf_team_group" {
  description = "List of User Ids for the Terraform Team"
  type        = list(string)
}

variable "aks_cluster_admin_group" {
  description = "Group name for the AKS Cluster Admins"
  type        = string
}

variable "aks_cluster_user_group" {
  description = "Group name for the AKS Cluster Users"
  type        = string
}

variable "aks_rbac_admin_group" {
  description = "Group name for the AKS RBAC Admins"
  type        = string
}

variable "aks_rbac_reader_group" {
  description = "Group name for the AKS RBAC Readers"
  type        = string
}

variable "aks_rbac_writer_group" {
  description = "Group name for the AKS RBAC Writers"
  type        = string
}