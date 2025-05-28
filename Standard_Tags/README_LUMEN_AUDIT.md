# Standard Tags Terraform Module (Lumen Audit Compliant)

## Description

This Terraform module generates a standardized set of Lumen tags. It helps ensure consistency in tagging across your environment, which is crucial for cost management, governance, and operational tracking. The module takes various inputs related to application, cost, and environment, and outputs a map of tags.

This module applies Lumen's standard tagging strategy, including mandatory tags such as `mal_id`.

## Cloud Agnostic Note

This module is designed to be as cloud-agnostic as possible by simply generating a map of key-value pairs. While some tag names (e.g., `costRegion` derived from `var.location`) are conventional within Azure, the module itself does not interact directly with any cloud provider APIs. The `var.location` input is used to populate a tag value and does not dictate provider configuration for this module.

## Prerequisites

- Terraform v1.0.0 or later.

## Usage

To use this module, include it in your Terraform configuration and provide the necessary input variables. You can then use the `tags` output of this module to apply these standard tags to your resources.

```terraform
module "standard_tags" {
  source = "<path_to_standard_tags_module>" // Replace with the actual path or source

  # Required Inputs
  mal_id              = "MAL000123" 
  costAllocation      = "chargeback" // Must be "sharedcosts" or "chargeback"

  # Optional Inputs (provide as needed)
  location            = "centralus"
  resourcetype        = "rg"
  appid               = "APP001"
  appname             = "MyApplication"
  env                 = "dev"
  costCostCenter      = "12345"
  costVP              = "VP Name"
  costAppOwnerTech    = "techowner@example.com"
  costAppOwnerManager = "manager@example.com"
  costBudgetOwner     = "budgetowner@example.com"
  additionalcontext   = "01"
  costDivision        = "Division Name"
  appFunction         = "Core Function"
  monthlyBudget       = "1000"
  costbaseline        = "2023"
}

# Example of applying tags to an Azure resource group
# (Illustrative - this module does not create Azure resources itself)
# resource "azurerm_resource_group" "example" {
#   name     = "rg-example-${module.standard_tags.tags.environment}-${module.standard_tags.tags.appid}"
#   location = module.standard_tags.tags.costRegion 
#   tags     = module.standard_tags.tags
# }
# 
# output "example_resource_group_tags" {
#   description = "Tags applied to the example resource group."
#   value       = azurerm_resource_group.example.tags
# }
```

## Inputs

| Name                 | Description                                                                                                | Type     | Default     | Required   |
|----------------------|------------------------------------------------------------------------------------------------------------|----------|-------------|:----------:|
| `additionalcontext`  | Additional context for naming (e.g., 01, 02, web, app).                                                    | `string` | `""`        | no         |
| `appFunction`        | The function of the application or resource. Used for tagging purposes.                                    | `string` | `""`        | no         |
| `appid`              | The application ID. Used for tagging and naming purposes.                                                  | `string` | `""`        | no         |
| `appname`            | The application name. Used for tagging and naming purposes.                                                | `string` | `""`        | no         |
| `costAllocation`     | Cost allocation method. Must be either 'sharedcosts' or 'chargeback'.                                      | `string` | n/a         | yes        |
| `costAppOwnerManager`| The application owner manager. Used for tagging purposes.                                                  | `string` | `""`        | no         |
| `costAppOwnerTech`   | The technical application owner. Used for tagging and naming purposes.                                     | `string` | `""`        | no         |
| `costBudgetOwner`    | The budget owner. Used for tagging purposes.                                                               | `string` | `""`        | no         |
| `costCostCenter`     | The cost center code. Used for tagging and naming purposes.                                                | `string` | `""`        | no         |
| `costDivision`       | The business division. Used for tagging purposes.                                                          | `string` | `""`        | no         |
| `costVP`             | The VP responsible for the cost. Used for tagging purposes.                                                | `string` | `""`        | no         |
| `costbaseline`       | The year the resource or cost baseline was created. Used for tagging purposes.                             | `string` | `""`        | no         |
| `env`                | The environment code (e.g., dev, test, prod, sand, uat, dr). Used for tagging and naming purposes.            | `string` | `""`        | no         |
| `location`           | The Azure region where resources will be deployed. This is used for the 'costRegion' tag.                      | `string` | `""`        | no         |
| `mal_id`             | The MAL ID for tagging purposes. This is a mandatory tag for Lumen resources and should always be provided. | `string` | n/a         | yes        |
| `monthlyBudget`      | The monthly budget allocated. Used for tagging purposes.                                                   | `string` | `""`        | no         |
| `resourcetype`       | The resource type being deployed (e.g., rg, vm, sql). Used for tagging purposes.                           | `string` | `""`        | no         |

*Note: While many inputs have default empty string values, it is recommended to provide meaningful values for all tags relevant to your organization's tagging policy. `mal_id` and `costAllocation` inputs are now required.*

## Outputs

| Name   | Description                                       |
|--------|---------------------------------------------------|
| `tags` | A map of standard tags generated by the module.   |

## Examples

See the `examples/simple_usage` directory for a basic implementation. The `examples/simple_usage/main.tf` file shows how to declare the module and provide values for the required inputs.

## Contributing

Contributions to this module are welcome. Please follow these general guidelines:
- Open an issue to discuss any significant changes or new features.
- Ensure that your code adheres to the existing style and conventions.
- Include updates to documentation (this README, examples) with your changes.
- Test your changes thoroughly.
- Write clear and descriptive commit messages.

For more details, refer to the main repository's contribution guidelines if available.

## Support Model

This module is community-supported. For issues, questions, or feature requests, please use the GitHub issue tracker associated with this repository. There is no official Service Level Agreement (SLA), but the maintainers will make a best effort to address concerns. When reporting an issue, please provide:
- A clear description of the problem or request.
- Steps to reproduce the issue.
- Relevant Terraform configuration snippets.
- Any error messages encountered.
- Your Terraform version and relevant provider versions.

---
*This README is generated and maintained following Lumen standards.*
