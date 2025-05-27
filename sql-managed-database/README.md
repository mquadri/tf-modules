# tf-modules-azure-sql-managed-database
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=0.13 |
| <a name="requirement_validation"></a> [validation](#requirement\_validation) | ~> 1.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mssql_managed_database.database](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_managed_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name for the database to be created | `string` | n/a | yes |
| <a name="input_sql_managed_instance_id"></a> [sql\_managed\_instance\_id](#input\_sql\_managed\_instance\_id) | ID of the SQL Managed Instance where the database will be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->