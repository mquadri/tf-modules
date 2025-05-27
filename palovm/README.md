<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
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
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_availability_set.backend](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set) | resource |
| [azurerm_network_interface.ha2](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface.mgmt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface.private-trust](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_interface.public-untrust](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.mgmt](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_public_ip.public-untrust](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_machine.one](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_resource_group.rg_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_avzone"></a> [avzone](#input\_avzone) | The availability zone to use | `string` | `"1"` | no |
| <a name="input_avzones"></a> [avzones](#input\_avzones) | for zone-redundant with 3 availability zone | `list(string)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |
| <a name="input_bootstrap_options"></a> [bootstrap\_options](#input\_bootstrap\_options) | Bootstrap options to pass to VM-Series instance. | `string` | `""` | no |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_diagnostics_storage_uri"></a> [diagnostics\_storage\_uri](#input\_diagnostics\_storage\_uri) | The storage account's blob endpoint to hold diagnostic files. | `string` | `null` | no |
| <a name="input_enable_plan"></a> [enable\_plan](#input\_enable\_plan) | Enable usage of the Offer/Plan on Azure Marketplace. Even plan sku "byol", which means "bring your own license", still requires accepting on the Marketplace (as of 2021). Can be set to `false` when using a custom image. | `bool` | `true` | no |
| <a name="input_enable_zones"></a> [enable\_zones](#input\_enable\_zones) | If false, the input `avzone` is ignored and also all created Public IP addresses default to not to use Availability Zones (the `No-Zone` setting). It is intended for the regions that do not yet support Availability Zones. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_ha2_subnet_id"></a> [ha2\_subnet\_id](#input\_ha2\_subnet\_id) | subnet id of ha2 subnet | `string` | n/a | yes |
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | See the [provider documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine#identity_type). | `string` | `"SystemAssigned"` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | The Azure Offer identifier corresponding to a published image. For `img_version` 9.1.1 or above, use "vmseries-flex"; for 9.1.0 or below use "vmseries1". | `string` | `"vmseries-flex"` | no |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | The Azure Publisher identifier for a image which should be deployed. | `string` | `"paloaltonetworks"` | no |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | VM-series SKU - list available with `az vm image list -o table --all --publisher paloaltonetworks` | `string` | `"bundle2"` | no |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | VM-series PAN-OS version - list available for a default `img_offer` with `az vm image list -o table --publisher paloaltonetworks --offer vmseries-flex --all` | `string` | `"10.1.5-h2"` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Type of OS Managed Disk to create for the virtual machine. Possible values are `Standard_LRS`, `StandardSSD_LRS` or `Premium_LRS`. The `Premium_LRS` works only for selected `vm_size` values, details in Azure docs. | `string` | `"StandardSSD_LRS"` | no |
| <a name="input_metrics_retention_in_days"></a> [metrics\_retention\_in\_days](#input\_metrics\_retention\_in\_days) | Specifies the retention period in days. Possible values are 0, 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90. A special value 0 disables creation of Application Insights altogether. | `number` | `null` | no |
| <a name="input_mgmt_subnet_id"></a> [mgmt\_subnet\_id](#input\_mgmt\_subnet\_id) | subnet id of management subnet | `string` | n/a | yes |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | name of vm | `any` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Initial administrative password to use for VM-Series. Mind the [Azure-imposed restrictions](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-password-requirements-when-creating-a-vm). | `string` | n/a | yes |
| <a name="input_private_subnet_id"></a> [private\_subnet\_id](#input\_private\_subnet\_id) | subnet id of private-trust subnet | `string` | n/a | yes |
| <a name="input_public_subnet_id"></a> [public\_subnet\_id](#input\_public\_subnet\_id) | subnet id of public-untrust subnet | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the existing resource group where to place the resources created. | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Initial administrative username to use for VM-Series. Mind the [Azure-imposed restrictions](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-username-requirements-when-creating-a-vm). | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Azure VM size (type) to be created. Consult the *VM-Series Deployment Guide* as only a few selected sizes are supported. | `string` | `"Standard_DS4_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_avset_id"></a> [avset\_id](#output\_avset\_id) | the av set ID |
| <a name="output_metrics_instrumentation_key"></a> [metrics\_instrumentation\_key](#output\_metrics\_instrumentation\_key) | The Instrumentation Key of the created instance of Azure Application Insights. The instance is unused by default, but is ready to receive custom PAN-OS metrics from the firewalls. To use it, paste this Instrumentation Key into PAN-OS -> Device -> VM-Series -> Azure. |
| <a name="output_mgmt_ip_address_private"></a> [mgmt\_ip\_address\_private](#output\_mgmt\_ip\_address\_private) | Private IP address of mgmt interface |
| <a name="output_mgmt_ip_address_public"></a> [mgmt\_ip\_address\_public](#output\_mgmt\_ip\_address\_public) | VM-Series management IP address. If `create_public_ip` was `true`, it is a public IP address, otherwise a private IP address. |
| <a name="output_principal_id"></a> [principal\_id](#output\_principal\_id) | The oid of Azure Service Principal of the created VM-Series. Usable only if `identity_type` contains SystemAssigned. |
<!-- END_TF_DOCS -->