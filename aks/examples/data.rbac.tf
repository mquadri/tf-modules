#RBAC
# tflint-ignore: terraform_unused_declarations
data "azuread_group" "aks_cluster_admin_group" {
  display_name = var.aks_cluster_admin_group
}

# tflint-ignore: terraform_unused_declarations
data "azuread_group" "aks_cluster_user_group" {
  display_name = var.aks_cluster_user_group
}

# tflint-ignore: terraform_unused_declarations
data "azuread_group" "aks_rbac_admin_group" {
  display_name = var.aks_rbac_admin_group
}

# tflint-ignore: terraform_unused_declarations
data "azuread_group" "aks_rbac_reader_group" {
  display_name = var.aks_rbac_reader_group
}

# tflint-ignore: terraform_unused_declarations
data "azuread_group" "aks_rbac_writer_group" {
  display_name = var.aks_rbac_writer_group
}

# tflint-ignore: terraform_unused_declarations
data "azuread_service_principal" "ccoe-spn" {
  display_name = "spn-acf-prod-pci-terraform-automation"
}

# tflint-ignore: terraform_unused_declarations
data "azuread_user" "tfteam" {
  count               = length(var.tf_team_group)
  user_principal_name = var.tf_team_group[count.index]
}
