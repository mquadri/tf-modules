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
| [azurerm_managed_disk.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/managed_disk) | resource |
| [azurerm_network_interface.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_virtual_machine.panorama](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_machine_data_disk_attachment.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_resource_group.rg_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additionalcontext"></a> [additionalcontext](#input\_additionalcontext) | used for naming purposes such as 01 or 02 | `string` | n/a | yes |
| <a name="input_appFunction"></a> [appFunction](#input\_appFunction) | app function | `string` | n/a | yes |
| <a name="input_appid"></a> [appid](#input\_appid) | The related application for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_appname"></a> [appname](#input\_appname) | the app name for the resources.  Used for tagging and naming purposes | `string` | n/a | yes |
| <a name="input_avzone"></a> [avzone](#input\_avzone) | The availability zone to use, for example "1", "2", "3". Ignored if `enable_zones` is false. Use `avzone = null` to disable the use of Availability Zones. | `any` | `null` | no |
| <a name="input_avzones"></a> [avzones](#input\_avzones) | After provider version 3.x you need to specify in which availability zone(s) you want to place IP.<br>ie: for zone-redundant with 3 availability zone in current region value will be:<pre>["1","2","3"]</pre> | `list(string)` | `[]` | no |
| <a name="input_boot_diagnostic_storage_uri"></a> [boot\_diagnostic\_storage\_uri](#input\_boot\_diagnostic\_storage\_uri) | Existing diagnostic storage uri | `string` | `null` | no |
| <a name="input_costAllocation"></a> [costAllocation](#input\_costAllocation) | can only be sharedcosts or chargeback | `string` | n/a | yes |
| <a name="input_costAppOwnerManager"></a> [costAppOwnerManager](#input\_costAppOwnerManager) | The app owner manager responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costAppOwnerTech"></a> [costAppOwnerTech](#input\_costAppOwnerTech) | The app owner responsible for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costBudgetOwner"></a> [costBudgetOwner](#input\_costBudgetOwner) | The budget owner responsible for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costCostCenter"></a> [costCostCenter](#input\_costCostCenter) | The cost center code for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_costDivision"></a> [costDivision](#input\_costDivision) | cost division | `string` | n/a | yes |
| <a name="input_costVP"></a> [costVP](#input\_costVP) | The cost vp for resources. Used for tagging purposes. | `string` | n/a | yes |
| <a name="input_costbaseline"></a> [costbaseline](#input\_costbaseline) | year resource created | `string` | n/a | yes |
| <a name="input_custom_image_id"></a> [custom\_image\_id](#input\_custom\_image\_id) | Absolute ID of your own Custom Image to be used for creating Panorama. If set, the `username`, `password`, `panorama_version`, `panorama_publisher`, `panorama_offer`, `panorama_sku` inputs are all ignored (these are used only for published images, not custom ones). The Custom Image is expected to contain PAN-OS software. | `string` | `null` | no |
| <a name="input_enable_plan"></a> [enable\_plan](#input\_enable\_plan) | Enable usage of the Offer/Plan on Azure Marketplace. Even plan sku "byol", which means "bring your own license", still requires accepting on the Marketplace (as of 2021). Can be set to `false` when using a custom image. | `bool` | `true` | no |
| <a name="input_enable_zones"></a> [enable\_zones](#input\_enable\_zones) | If false, the input `avzone` is ignored and all created public IPs default not to use Availability Zones (the `No-Zone` setting). It is intended for the regions that do not yet support Availability Zones. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | The environment code the for resources. Used for tagging and naming purposes. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | n/a | yes |
| <a name="input_logging_disks"></a> [logging\_disks](#input\_logging\_disks) | A map of objects describing the additional disk configuration. The keys of the map are the names and values are { size, zone, lun }. <br> The size value is provided in GB. The recommended size for additional (optional) disks is at least 2TB (2048 GB). Example:<pre>{<br>  logs-1 = {<br>    size: "2048"<br>    zone: "1"<br>    lun: "1"<br>  }<br>  logs-2 = {<br>    size: "2048"<br>    zone: "2"<br>    lun: "2"<br>    disk_type: "StandardSSD_LRS"<br>  }<br>}</pre> | `map(any)` | `{}` | no |
| <a name="input_monthlyBudget"></a> [monthlyBudget](#input\_monthlyBudget) | monthly budget | `string` | n/a | yes |
| <a name="input_os_disk_name"></a> [os\_disk\_name](#input\_os\_disk\_name) | The name of OS disk. The name is auto-generated when not provided. | `string` | `null` | no |
| <a name="input_panorama_disk_type"></a> [panorama\_disk\_type](#input\_panorama\_disk\_type) | Specifies the type of managed disk to create. Possible values are either Standard\_LRS, StandardSSD\_LRS, Premium\_LRS or UltraSSD\_LRS. | `string` | `"StandardSSD_LRS"` | no |
| <a name="input_panorama_offer"></a> [panorama\_offer](#input\_panorama\_offer) | Panorama offer. | `string` | `"panorama"` | no |
| <a name="input_panorama_publisher"></a> [panorama\_publisher](#input\_panorama\_publisher) | Panorama Publisher. | `string` | `"paloaltonetworks"` | no |
| <a name="input_panorama_size"></a> [panorama\_size](#input\_panorama\_size) | Virtual Machine size. | `string` | `"Standard_D5_v2"` | no |
| <a name="input_panorama_sku"></a> [panorama\_sku](#input\_panorama\_sku) | Panorama SKU. | `string` | `"byol"` | no |
| <a name="input_panorama_version"></a> [panorama\_version](#input\_panorama\_version) | Panorama PAN-OS Software version. List published images with `az vm image list -o table --all --publisher paloaltonetworks --offer panorama` | `string` | `"10.0.3"` | no |
| <a name="input_password"></a> [password](#input\_password) | Initial administrative password to use for Panorama. If not defined the `ssh_key` variable must be specified. Mind the [Azure-imposed restrictions](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-password-requirements-when-creating-a-vm). | `string` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the existing resource group where to place all the resources created by this module. | `string` | n/a | yes |
| <a name="input_resourcetype"></a> [resourcetype](#input\_resourcetype) | the resource type being deployed see naming standards for example | `string` | n/a | yes |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | A list of initial administrative SSH public keys that allow key-pair authentication.<br><br>This is a list of strings, so each item should be the actual public key value. If you would like to load them from files instead, following method is available:<pre>[<br>  file("/path/to/public/keys/key_1.pub"),<br>  file("/path/to/public/keys/key_2.pub")<br>]</pre>If the `password` variable is also set, VM-Series will accept both authentication methods. | `list(string)` | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id where the interfaces will reside | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to be associated with the resources created. | `map(any)` | `{}` | no |
| <a name="input_username"></a> [username](#input\_username) | Initial administrative username to use for Panorama. Mind the [Azure-imposed restrictions](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/faq#what-are-the-username-requirements-when-creating-a-vm). | `string` | `"panadmin"` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | name of the vnet where the vm's will be deployed to | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | name of the resource group where the vnet resides | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->