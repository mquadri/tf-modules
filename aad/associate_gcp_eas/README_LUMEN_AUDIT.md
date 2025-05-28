# Azure AD Group to GCP EAS Association Terraform Module (Lumen Audit Compliant)

## Description

This Terraform module automates the assignment of a pre-existing Azure Active Directory (AAD) group to specific App Roles for Google Cloud Platform (GCP) Enterprise Applications (Service Principals) registered in Azure. It is designed to simplify the process of granting AAD group members the necessary permissions for GCP services, typically for functionalities like Single Sign-On (SSO) and User Provisioning.

The module functions by:
1.  Looking up the specified AAD group by its display name.
2.  Looking up the target GCP Service Principals by their display names (configurable, with defaults for "Google Cloud (GCP Lumen SSO)" and "Google Cloud (GCP Lumen Provisioning)").
3.  Assigning the AAD group to a specified App Role ID for each of these Service Principals.

**Important:** This module does not create the AAD group, the GCP Service Principals, or the App Roles themselves. These entities must exist prior to using this module.

## Prerequisites

Before using this module, ensure the following resources and configurations are in place within your Azure Active Directory:

-   An existing Azure AD group that you intend to assign roles to. The display name of this group is a required input (`var.group_name`).
-   The "Google Cloud (GCP Lumen SSO)" (or custom named) Enterprise Application / Service Principal must exist.
-   The "Google Cloud (GCP Lumen Provisioning)" (or custom named) Enterprise Application / Service Principal must exist.
-   The App Role ID (`var.app_role_id_for_association`) you wish to assign must be a valid role defined in the manifests of the target GCP Enterprise Applications.

## Usage

```terraform
module "aad_gcp_association" {
  source = "<path_to_this_module>" // Or your module source

  group_name = "my-aad-group-for-gcp-access" // Replace with your AAD group's display name

  // Optional: Override the default App Role ID if needed.
  // The default is "9e79c739-f165-49e8-8745-fe08f1634b3b", which typically represents the 'User' role for many enterprise apps.
  // app_role_id_for_association = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" 

  // Optional: Override default GCP Service Principal display names if they differ in your environment
  // gcp_sso_service_principal_display_name  = "Custom GCP SSO SP Name"
  // gcp_prov_service_principal_display_name = "Custom GCP Provisioning SP Name"
}

output "sso_assignment_id" {
  description = "ID of the SSO group assignment."
  value       = module.aad_gcp_association.gcp_lumen_sso_group_assignment_id
}

output "prov_assignment_id" {
  description = "ID of the Provisioning group assignment."
  value       = module.aad_gcp_association.gcp_lumen_prov_group_assignment_id
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
| [azuread_app_role_assignment.gcp_lumen_prov_group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/resources/app_role_assignment) | resource |
| [azuread_app_role_assignment.gcp_lumen_sso_group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/resources/app_role_assignment) | resource |
| [azuread_group.group](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/group) | data source |
| [azuread_service_principal.gcp_prov_app_sp](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/service_principal) | data source |
| [azuread_service_principal.gcp_sso_app_sp](https://registry.terraform.io/providers/hashicorp/azuread/2.26.1/docs/data-sources/service_principal) | data source |

## Inputs

| Name                                            | Description                                                                                                                                                                           | Type     | Default                                   | Required   |
|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-------------------------------------------|:----------:|
| `app_role_id_for_association`                 | The App Role ID (usually from an Enterprise Application's manifest) to assign to the AAD group for the GCP service principals. This is typically a user role like 'User' or a specific custom role ID. | `string` | `"9e79c739-f165-49e8-8745-fe08f1634b3b"`    | no         |
| `gcp_prov_service_principal_display_name`       | The display name of the GCP Provisioning Azure AD Service Principal.                                                                                                                    | `string` | `"Google Cloud (GCP Lumen Provisioning)"` | no         |
| `gcp_sso_service_principal_display_name`        | The display name of the GCP SSO Azure AD Service Principal.                                                                                                                               | `string` | `"Google Cloud (GCP Lumen SSO)"`          | no         |
| `group_name`                                    | Name of the Azure AD group to assign roles to. This group must already exist.                                                                                                           | `string` | n/a                                       | yes        |

## Outputs

| Name                                         | Description                                                                          |
|----------------------------------------------|--------------------------------------------------------------------------------------|
| `gcp_lumen_prov_group_assignment_id`         | The ID of the Azure AD app role assignment for the GCP Lumen Provisioning group.     |
| `gcp_lumen_sso_group_assignment_id`          | The ID of the Azure AD app role assignment for the GCP Lumen SSO group.              |
<!-- END_TF_DOCS -->

## Examples

See the `examples/` directory for a runnable example, including `main.tf`, `variables.tf`, and `versions.tf`.

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
