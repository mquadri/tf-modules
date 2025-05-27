variable "extensions" {
  type = map(object({
    name                        = string
    virtual_machine_id          = string
    publisher                   = string
    type                        = string
    type_handler_version        = string
    auto_upgrade_minor_version  = optional(bool)
    automatic_upgrade_enabled   = optional(bool)
    failure_suppression_enabled = optional(bool, false)
    settings                    = optional(string)
    protected_settings          = optional(string)
    provision_after_extensions  = optional(list(string), [])
    tags                        = optional(map(string), null)
  }))
  # tflint-ignore: terraform_sensitive_variable_no_default
  default     = {}
  description = <<EXTENSIONS
This map of objects is used to create additional `azurerm_virtual_machine_extension` resources, the argument descriptions could be found at [the document](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension).

- `<map key>` - Provide a custom key value to define each extension object
  - `name` (Required) - Set a custom name on this value if you want the guest configuration extension to have a custom name
  - `publisher` (Required) - Configure the publisher for the extension to be deployed. The Publisher and Type of Virtual Machine Extensions can be found using the Azure CLI, via: az vm extension image list --location westus -o table
  - `type` (Required) - Configure the type value for the extension to be deployed. 
  - `type_handler_version` (Required) - The type handler version for the extension. A common value is 1.0.
  - `auto_upgrade_minor_version` (Optional) - Set this to false to avoid automatic upgrades for minor versions on the extension.  Defaults to true
  - `automatic_upgrade_enabled` (Optional) - Set this to false to avoid automatic upgrades for major versions on the extension.  Defaults to true
  - `failure_suppression_enabled` (Optional) - Should failures from the extension be suppressed? Possible values are true or false. Defaults to false. Operational failures such as not connecting to the VM will not be suppressed regardless of the failure_suppression_enabled value.
  - `settings` (Optional) - The settings passed to the extension, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)
  - `protected_settings` (Optional) - The protected_settings passed to the extension, like settings, these are specified as a JSON object in a string. Certain VM Extensions require that the keys in the protected_settings block are case sensitive. If you're seeing unhelpful errors, please ensure the keys are consistent with how Azure is expecting them (for instance, for the JsonADDomainExtension extension, the keys are expected to be in TitleCase.)
  - `provision_after_extensions` (Optional) - list of strings that specifies the collection of extension names after which this extension needs to be provisioned.
  - `protected_settings_from_key_vault` (Optional) object for protected settings.  Cannot be used with `protected_settings`
    - `secret_url` (Required) - The Secret URL of a Key Vault Certificate. This can be sourced from the `secret_id` field within the `azurerm_key_vault_certificate` Resource.
    - `source_vault_id` (Required) - the Azure resource ID of the key vault holding the secret
  - `tags` (Optional) - A mapping of tags to assign to the extension resource.

Example Inputs:

```hcl
#custom script extension example - linux
extensions = [
  {
    name = "CustomScriptExtension"
    publisher = "Microsoft.Azure.Extensions"
    type = "CustomScript"
    type_handler_version = "2.0"
    settings = <<SETTINGS
      {
        "script": "<base 64 encoded script file>"
      }
    SETTINGS
  }
]

#custom script extension example - windows
extensions = [
  {
    name = "CustomScriptExtension"
    publisher = "Microsoft.Compute"
    type = "CustomScriptExtension"
    type_handler_version = "1.10"
    settings = <<SETTINGS
      {
        "timestamp":123456789
      }
    SETTINGS
    protected_settings = <<PROTECTED_SETTINGS
      {
        "commandToExecute": "myExecutionCommand",
        "storageAccountName": "myStorageAccountName",
        "storageAccountKey": "myStorageAccountKey",
        "managedIdentity" : {},
        "fileUris": [
            "script location"
        ]
      }
    PROTECTED_SETTINGS        
  }
]
```
EXTENSIONS
  nullable    = false
  sensitive   = false # Because `protected_settings` is sensitive

  validation {
    condition = length(var.extensions) == length(distinct([
      for e in var.extensions : e.type
    ]))
    error_message = "`type` in `vm_extensions` must be unique."
  }
}
