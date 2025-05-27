<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.8 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.Databricks](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.ImageGallery](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.LandingZone](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.SQLDatabase](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.SQLServer](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.SQLServerMI](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.SQLServerMIDB](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.Subscriptions](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.accesspolicy](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.ad_group](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.apimanagement](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.appgateway](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.containerregistry](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.cosmosdbaccount](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.cosmossqldb](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.keyvault](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.naming](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.network_security_group](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.network_security_group_association](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.rbac](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.redis](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.resourcegroups](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.routetable](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.storage_account](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.storage_account_blob](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.storage_account_container](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.synapse_spark_pool](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.synapse_sql_pool](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.synapse_workspace](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.terraformmodules](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.virtuaLnetwork](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [github_repository.virtualmachine](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_owner"></a> [owner](#input\_owner) | value for the owner of the repository | `string` | `"CenturyLink"` | no |
| <a name="input_token"></a> [token](#input\_token) | GitHub token | `string` | `"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"` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | List of topics for referencing the repository | `list` | <pre>[<br>  "tf-modules-azure"<br>]</pre> | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | GitHub visibility | `string` | `"internal"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->