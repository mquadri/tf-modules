## Setup
- Login to az cli: az login
- Select Azure Subscription with AKS cluster: az account set --subscription SUB_NAME
- Get access credentials for a managed Kubernetes cluster:  az aks get-credentials --resource-group RG_NAME --name AKS_NAME
```
module "wiz" {
  source = "github.com/CenturyLink/tf-modules-azure//wiz-broker"
}

# Send output of this command to CVAS: terraform output -raw wiz_tf_deploy_token
output "wiz_tf_deploy_token" {
  description = "Send output of this command to CVAS: terraform output -raw wiz_tf_deploy_token"
  value = module.wiz.wiz_tf_deploy_token
  sensitive = true
}
```
```
provider "azurerm" {
  features {}
  subscription_id = "10521297-db8f-42a8-950f-3537da7cfee5"
}

terraform {
  required_version = ">=1.4.6"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.64.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.wiz_cluster_reader](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.wiz_cluster_reader](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_namespace.wiz](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_role.wiz_tf_deploy_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role) | resource |
| [kubernetes_role_binding.wiz_tf_deploy_access_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_secret.wiz_tf_deploy](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_service_account.wiz_cluster_reader](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [kubernetes_service_account.wiz_tf_deploy](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [kubernetes_secret.wiz_tf_deploy_print](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wiz_tf_deploy_token"></a> [wiz\_tf\_deploy\_token](#output\_wiz\_tf\_deploy\_token) | n/a |
