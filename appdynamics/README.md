tf-modules-appdynamics
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_appdynamics"></a> [appdynamics](#requirement\_appdynamics) | 0.1.0 |
| <a name="requirement_oauth"></a> [oauth](#requirement\_oauth) | 1.6.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_appdynamics"></a> [appdynamics](#provider\_appdynamics) | 0.1.0 |
| <a name="provider_oauth"></a> [oauth](#provider\_oauth) | 1.6.7 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [appdynamics_action.bigpanda](https://registry.terraform.io/providers/harryemartland/appdynamics/0.1.0/docs/resources/action) | resource |
| [appdynamics_action.email](https://registry.terraform.io/providers/harryemartland/appdynamics/0.1.0/docs/resources/action) | resource |
| [appdynamics_health_rule.slow_response_time](https://registry.terraform.io/providers/harryemartland/appdynamics/0.1.0/docs/resources/health_rule) | resource |
| [appdynamics_policy.all_health_rules_bigpanda_on_trigger](https://registry.terraform.io/providers/harryemartland/appdynamics/0.1.0/docs/resources/policy) | resource |
| [appdynamics_policy.all_health_rules_email_on_trigger](https://registry.terraform.io/providers/harryemartland/appdynamics/0.1.0/docs/resources/policy) | resource |
| [oauth_token.appd_access_token](https://registry.terraform.io/providers/SvenHamers/oauth/1.6.7/docs/data-sources/token) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_bigpanda_template"></a> [alert\_bigpanda\_template](#input\_alert\_bigpanda\_template) | HTTP Template to use to connect to BigPanda | `string` | `""` | no |
| <a name="input_alert_email_to"></a> [alert\_email\_to](#input\_alert\_email\_to) | Email address that will get alerts for the application | `list(string)` | `[]` | no |
| <a name="input_appd_client_id"></a> [appd\_client\_id](#input\_appd\_client\_id) | AppDynamics OAuth2 Client ID | `string` | n/a | yes |
| <a name="input_appd_client_secret"></a> [appd\_client\_secret](#input\_appd\_client\_secret) | AppDynamics OAuth2 Client Secret | `string` | n/a | yes |
| <a name="input_appd_controller_url"></a> [appd\_controller\_url](#input\_appd\_controller\_url) | AppDynamics controller URL | `string` | n/a | yes |
| <a name="input_application_id"></a> [application\_id](#input\_application\_id) | AppDynamics application id | `number` | n/a | yes |
| <a name="input_slow_transactions_critical"></a> [slow\_transactions\_critical](#input\_slow\_transactions\_critical) | A critical event will be triggered for transactions slower than this value (in millisecons) | `number` | `3000` | no |
| <a name="input_slow_transactions_warn"></a> [slow\_transactions\_warn](#input\_slow\_transactions\_warn) | A warning event will be triggered for transactions slower than this value (in millisecons) | `number` | `2000` | no |
| <a name="input_tiers"></a> [tiers](#input\_tiers) | Tiers to monitor in the application | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appd_access_token"></a> [appd\_access\_token](#output\_appd\_access\_token) | n/a |
<!-- END_TF_DOCS -->