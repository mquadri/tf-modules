## Setup
- Login to az cli: az login
- Select Azure Subscription with AKS cluster: az account set --subscription SUB_NAME
- Get access credentials for a managed Kubernetes cluster:  az aks get-credentials --resource-group RG_NAME --name AKS_NAME
- Pull required tokens from CorpSec KeyVault. Contact dmitri.smirnov@lumen.com for related secrets if required
```
export TF_VAR_FALCON_CID=$(az keyvault secret show --name FALCON-CID --vault-name corpsec-keyvault-tf --query value -o tsv)
export TF_VAR_FALCON_PROVTOKEN=$(az keyvault secret show --name FALCON-PROVTOKEN --vault-name corpsec-keyvault-tf --query value -o tsv)
export TF_VAR_FALCON_PULLTOKEN=$(az keyvault secret show --name FALCON-PULLTOKEN --vault-name corpsec-keyvault-tf --query value -o tsv)
```
- Create main.tf, variables and provider.tf in crowdstrike-aks directory based on examples provided
```
module "crowdstrike" {
  source = "github.com/CenturyLink/tf-modules-azure//crowdstrike-aks"
  FALCON_CID=var.FALCON_CID
  FALCON_PROVTOKEN=var.FALCON_PROVTOKEN
  FALCON_PULLTOKEN=var.FALCON_PULLTOKEN
}
```
```
variable "FALCON_CID" {
  type = string
}

variable "FALCON_PROVTOKEN" {
  type = string
}

variable "FALCON_PULLTOKEN" {
  type = string
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

provider "helm" {
  kubernetes {
     config_path = "~/.kube/config"
  }
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
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.crowdstrike-falcon](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_FALCON_CID"></a> [FALCON\_CID](#input\_FALCON\_CID) | n/a | `string` | n/a | yes |
| <a name="input_FALCON_PROVTOKEN"></a> [FALCON\_PROVTOKEN](#input\_FALCON\_PROVTOKEN) | n/a | `string` | n/a | yes |
| <a name="input_FALCON_PULLTOKEN"></a> [FALCON\_PULLTOKEN](#input\_FALCON\_PULLTOKEN) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
