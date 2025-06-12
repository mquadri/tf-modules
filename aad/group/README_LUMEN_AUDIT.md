# Azure AD Group Terraform Module (Lumen Audit Compliant)

## Description

This Terraform module creates and manages Azure Active Directory (AAD) groups. It allows for specifying group owners and ensures the group is security-enabled. This module is foundational for managing access and permissions within Azure AD.

The module currently creates security-enabled groups. Future enhancements might include options for other group types (e.g., Microsoft 365 groups if mail-enabled features are needed).

## Prerequisites

-   Azure Active Directory instance.
-   Credentials configured for Terraform to interact with Azure AD.
-   Users specified in `group_owners` must already exist in Azure AD. The module will use their User Principal Names (UPNs) or Object IDs to look them up.

## Usage

```terraform
module "aad_group" {
  source = "<path_to_this_module>" // Or your module source

  group_name   = "my-security-group"
  group_owners = [
    "user1@example.com",
    "user2_object_id_or_upn"
  ]

  // Optional standard Lumen tags (though AAD groups are not directly taggable with Azure tags)
  // app_id      = "APP001"
  // environment = "dev"
  // mal_id      = "MAL00123"
}

output "created_group_id" {
  description = "The Object ID of the created AAD group."
  value       = module.aad_group.group_id
}

output "created_group_name" {
  description = "The display name of the created AAD group."
  value       = module.aad_group.group_name
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.26.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.26.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_group.group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/resources/group) | resource |
| [azuread_user.owner](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/user) | data source |

## Inputs

| Name             | Description                                                                                                | Type           | Default   | Required   |
|------------------|------------------------------------------------------------------------------------------------------------|----------------|-----------|:----------:|
| `app_id`         | Application ID, typically used for tagging. Not directly applied to AAD groups but included for consistency. | `string`       | `null`    | no         |
| `environment`    | Environment (e.g., dev, test, prod). Typically used for tagging. Not directly applied to AAD groups.          | `string`       | `null`    | no         |
| `group_name`     | The display name of the Azure AD group to create.                                                            | `string`       | n/a       | yes        |
| `group_owners`   | List of owner User Principal Names (UPNs) or Object IDs for the group. These users must exist in Azure AD.   | `list(string)` | n/a       | yes        |
| `mal_id`         | MAL ID, typically used for tagging. Not directly applied to AAD groups but included for consistency.         | `string`       | `null`    | no         |

## Outputs

| Name          | Description                                 |
|---------------|---------------------------------------------|
| `group_id`    | The Object ID of the created AAD group.     |
| `group_name`  | The display name of the created AAD group.  |
<!-- END_TF_DOCS -->

## Examples

See the `examples/` directory for a runnable example, including `main.tf`, `variables.tf`, and `versions.tf`.

## Error Handling

The module relies on the Azure AD provider for error handling. If users specified in `group_owners` do not exist, the `data "azuread_user"` lookup will fail, preventing the group's creation. Ensure all specified owners are valid and present in Azure AD.

## Contributing

Contributions to this module are welcome. Please follow these general guidelines:
- Open an issue to discuss any significant changes or new features.
- Ensure that your code adheres to the existing style and conventions.
- Include updates to documentation (this README, examples) with your changes. Use `terraform-docs` to generate the Inputs and Outputs sections if applicable (by running `terraform-docs markdown table --output-file README_LUMEN_AUDIT.md --output-mode inject .` within the module directory).
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
