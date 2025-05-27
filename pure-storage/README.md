<!-- BEGIN_TF_DOCS -->
# CBS-Pure-storage

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.71.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (>= 3.5.0)

- <a name="requirement_cbs"></a> [cbs](#requirement\_cbs) (~> 0.11.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>= 3.71.0)

- <a name="provider_random"></a> [random](#provider\_random) (>= 3.5.0)

- <a name="provider_cbs"></a> [cbs](#provider\_cbs) (~> 0.11.0)

## Resources

The following resources are used by this module:

- [tls_private_key.cbs_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) (resource)
- [azurerm_key_vault_secret.cbs_private_key_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) (resource)
- [azurerm_role_definition.cbs_role](https://registry.terraform.io/providers/hashicorp/azurerm/2.97.0/docs/data-sources/role_definition) (resource)
- [azurerm_role_assignment.role_assignment](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [cbs_array_azure.cbs_azure_instance](https://registry.terraform.io/providers/PureStorage-OpenConnect/cbs/latest/docs/resources/array_azure) (resource)

<!-- markdownlint-disable MD013 -->

## Required Inputs

The following input variables are required:

- `alert_recipients` (Optional) - List of email addresses to receive alerts.
- `array_model` (Required) - CBS array size to launch. The possible values are `V10MUR1`, `V20MUR1`, `V10MP2R2` or `V20MP2R2`.
- `array_name` (Required) - Name of the array, and the name of the managed application.
Required when the array is deployed for use in a Fusion cluster.
- `iscsi_subnet` (Required) - Subnet containing the iSCSI interfaces on the array.
- `jit_approval_group_object_ids` (Required) - A list of Azure group object IDs for people who are allowed to approve JIT requests. When used the maximum possible duration of a JIT access request will be set to `PT8H`.
The [azuread_group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) datasource can be used to look up the group_id from the name of the group.
- `key_vault_id` (Required) - Key Vault where provider stores sensitive information.
- `license_key` (Required) - Pure Storage-provided license key.
- `location` (Required) - Azure location in which to deploy the array.
- `log_sender_domain` (Required) - Domain name used to determine how CBS logs are parsed and treated by Pure Storage Support and Escalations.
- `management_subnet` (Required) - Subnet containing the management interfaces on the array.
- `plan` (Optional) - A managed application plan configuration block. See [below for nested schema](#nestedblock--plan).
- `pureuser_private_key_path` (Optional) - File path of the private key to enable SSH access to the controllers. You must specify one `pureuser_private_key_path` or one `pureuser_private_key`.
- `pureuser_private_key` (Optional) - Text content of the private key to enable SSH access to the controllers. You must specify one `pureuser_private_key_path` or one `pureuser_private_key`.
- `replication_subnet` (Required) - Subnet containing the replication interfaces on the array.
- `resource_group_name` (Required) - Name of the resource group in which to deploy the managed application.
- `system_subnet` (Required) - Subnet for the system interface of the Array.
- `tags` (Optional) - A list of tags to apply to all resources in the managed application.
- `resource_tags` (Optional) - A list of objects defining specific tags for specific resource types, overriding global tags if conflicting. See [below for nested schema](#nested-schema-for-resource_tags)
- `user_assigned_identity` (Required) - A required input that denotes the identity of the customer User Assigned identity.
- `virtual_network_id` (Required) - The ID of the virtual network that contains the network interfaces of the array.
- `zone` (Required) - The Availability Zone within the deployment location.
```

## Outputs

The following outputs are exported:

- `application_name` - The name of the managed application.
- `ct0_name` - The name of the controller ct0 instance.
- `ct1_name` - The name of the controller ct1 instance.
- `iscsi_endpoint_ct0` - iSCSI IP address and port of the ct0 instance.
- `iscsi_endpoint_ct1` - iSCSI IP address and port of the ct1 instance.
- `managed_resource_group_name` - The name of the managed resource group of the managed application.
- `management_endpoint` - Management IP address of the CBS instance.
- `management_endpoint_ct0` - Management IP address of the ct0 instance.
- `management_endpoint_ct1` - Management IP address of the ct1 instance.
- `replication_endpoint_ct0` - Replication IP address of the ct0 instance.
- `replication_endpoint_ct1` - Replication IP address of the ct1 instance.

## Example

```terraform
module "CBS-array" {
  source                      = "../"
  cbs_vnet_name               = var.cbs_vnet_name
  cbs_vnet_rg                 = var.cbs_vnet_rg
  keyvault_name               = var.keyvault_name
  keyvault_rg                 = var.keyvault_rg
  user_assigned_identity_name = var.user_assigned_identity_name
  user_assigned_identity_rg   = var.user_assigned_identity_rg
  array_name                  = var.array_name
  resource_group_location     = var.resource_group_location
  resource_group_name         = var.resource_group_name
  license_key                 = var.license_key
  log_sender_domain           = var.log_sender_domain
  alert_recipients            = var.alert_recipients
  array_model                 = var.array_model
  zone                        = var.zone
  cbs_subnet_mgmt_name        = var.cbs_subnet_mgmt_name
  cbs_subnet_sys_name         = var.cbs_subnet_sys_name
  cbs_subnet_iscsi_name       = var.cbs_subnet_iscsi_name
  cbs_subnet_repl_name        = var.cbs_subnet_repl_name
  jit_group_ids               = var.jit_group_ids

}

```
## Example Tfvars

```hcl
cbs_vnet_name               = "cbs-vnet"
cbs_vnet_rg                 = "test-rg"
keyvault_name               = "cbs-kv-1"
keyvault_rg                 = "test-rg"
user_assigned_identity_name = "cbs-identity"
user_assigned_identity_rg   = "test-rg"
array_name                  = "cbs-array"
resource_group_name         = "test-rg"
license_key                 = "CBS-TRIAL-LICENSE"
log_sender_domain           = "test.com"
alert_recipients            = ["test@test.com"]
array_model                 = "V10MUR1"
zone                        = 1
cbs_subnet_mgmt_name        = "management-subnet"
cbs_subnet_sys_name         = "system-subnet"
cbs_subnet_iscsi_name       = "iSCSI-subnet"
cbs_subnet_repl_name        = "replication-subnet"
jit_group_ids               = [""]
resource_group_location     = "EASTUS2"

```

<!-- END_TF_DOCS -->

       

## **Setup of pre-requisites for the Pure storage**

For setup of the pure storage, there are some pre-requisites specific to networking and security for successful deployment. The below documentation from pure-storage is used as a reference for complete setup:
[Pure Storage Documentation portal](https://support.purestorage.com/bundle/m_cbs_for_azure/page/Pure_Cloud_Block_Store/CBS_for_Azure/topics/topic/c_pure_cloud_block_store_for_azure.html)

## **Networking setup:**

## Vnet and Subnet:

* To begin with, a vnet is needed into which the pure-storage resource will be deployed.
* As per the documentation, we need to either have 4 subnets in the above created vnet or other option is to have 4 NICs inside single subnet. The preferred option would be to have 4 different subnets and below are the example names (each subnet serves a different purpose)
   * Management-subnet
   * System-subnet
   * iSCSI-subnet
   * Replication-subnet
* Make sure to have the vnets and subnets created before deployment of the pure-storage resource

## Outbound internet connection setup – NAT Gateway:

* Make sure to have an **outbound internet connectivity** to system-subnet which makes sure that Cloud Block Store managed application can phone home to Pure1, providing logs, alerts, and additional cloud management services and this connection should be established before deployment of the pure-storage resource.
* As per documentation, there are 2 ways with which outbound connectivity can be established:
  * Using **NAT Gateway** and attaching it to the system-subnet.
  * Using combination of Azure Firewall and route tables for internet connection.
* The preferred and easy approach would be to have the NAT gateway setup.
* Also make sure to associate the **system-subnet** with the NAT Gateway.

## Service endpoint configuration:

* A service endpoint needs to configured to enable Communication between Cloud Block Store and Azure Service Endpoints.
* Enable the below service endpoints in the **system-subnet:**
  * Microsoft.AzureCosmosDB
  * Microsoft.KeyVault
  * Microsoft.Storage

## Peering connection setup:

* If the deployment of the pure storage resource is done with Terraform, we need to make sure that the terraform commands are run from a Linux VM. This requirement is due to fact that the SSH connection is required from the Linux VM to the controllers of the pure storage resource (which are VMs).
* In order to establish the connection between the Linux VM’s vnet and the pure storage resource’s vnet, a peering connection is required.

## **Security configuration setup:**
-----------------------------

## User assigned identity – Custom role:

* A **user assigned managed identity** needs to be created to allow assignment of custom role to vnet.
* As per the documentation, the below custom role needs to be created:
  * "**Microsoft.Network/virtualNetworks/subnets/joinViaServiceEndpoint/action**"
* Once the custom role is in-place, assign the role to the managed identity and add the scope as **cbs vnet** which allows the pure storage vnet to have necessary role.
* The user-assigned identity resource-id needs to be passed as variable to pure storage resource.

## Keyvault Setup:

* The CBS pure storage resource expects a creation/availability of a private key that is required to be passed as part of resource creation. This private key along with the public key (generated by pure storage) will be used for login purpose.
* In order to securely store the private key, we can make use of the keyvault and store the key as secret. This ensures a secure storage of the private keys.
* The private key can be created with terraform using **tls_private_key** resource and with keyavult secret resource block, the private key can be pushed to the keyvault.
* The keyvault created will also be used by the pure-storage resource to internally create secrets and store the same in keyvault.

## **Post resource creation:**

* The pure storage resource is a managed application which takes care of creating a managed Resource group.
* This managed RG contains the resources required for the working of the pure storage which includes VMs, Load balancer, Data disks, keyvault, NSGs etc.
* In order to access the dashboard created by the pure storage resource, navigate to the pure storage managed application resource and choose the option **Parameters and Outputs** on the left pane.
* Under the **Outputs** section, check for the **floatingManagementIP** parameter and note down the IP. This is the Frontend IP of the Load balancer with which the pure storage resource dashboard can be accessed.
* The dashboard will request for username and password credentials. The default credentials can be accessed from the pure-storage documentation: [Default credentials for the pure-storage login](https://support.purestorage.com/bundle/m_cbs_for_azure/page/Pure_Cloud_Block_Store/CBS_for_Azure/Pure_Cloud_Block_Store_on_Azure_Implementation_Guide/topics/task/t_logging_onto_cloud_block_store.html)

## **Security concerns in managed resources:**

* The pure-storage resource provides multiple resources in the managed RG the configurations of which cannot be controlled by user before/while deployment.
* Some of the resources for which there may be security concerns due to open network include the open NSG rules and public keyvault.
* The NSGs deployed by pure-storage include inbound rules that are open to outer world without any restriction to specific IPs. Below are screenshots of the NSGs created by pure storage:



## **Deletion of Pure-storage resource:**

* If there is a requirement to delete the pure-storage and all its associated resources, we need to follow the below steps as mentioned in the documentation:
* If the pure-storage version you have deployed is 6.4+ versions, you may need to contact the pure-storage support team for the complete deletion of the resource.
* This is because of the feature introduced in version 6.4+ called **SafeMode** which protects the volumes on the array and prevents deletion of those protected objects.
* There will also be a default protection group **pgroup-auto** and if it has status as **Ratcheted** , it means the SafeMode is enabled.
* To determine the SafeMode status, navigate to the pure storage dashboard, choose the **Protection** option on the left pane and choose the **Array** tab that shows if the arrays are protected with protection groups. To get more details on the protection group, navigate to the **Protection Groups** tab to check the status of the protection group.
* Below screenshot shows the protection group:



* As per the documentation, before reaching out to Pure storage support team for deletion of the protection groups and other items, make sure to complete the below steps:

  * All Cloud Block Store volumes and snapshots must be deleted and eradicated prior to termination of a Cloud Block Store instance. This includes Protection Group snapshots. Note: you won't be able to eradicate snapshots under the default pgourp-auto or destroy the protection group itself.
  * All connected arrays and targets must be disconnected from any type of Purity replication.
  * Cloud Block Store instance must be able to phone home. This ensures the Cloud Block Store instance is properly de-registered in the Pure-as-a-Service subscription.
  * The last step is to enable Remote Assist.
  * Once the prerequisite array state has been achieved, request Pure Support and ask for decommissioning the array.
* Post the required deletion action from the pure-storage support team, the pure storage managed application in Azure can be deleted either directly in portal or thru the Terraform destroy command based on how the resource was created.