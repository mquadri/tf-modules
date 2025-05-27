<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_shared_image_gallery.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/shared_image_gallery) | resource |

## Inputs

The following arguments are supported:

* `name` - (Required) Specifies the name of the Shared Image Gallery. Changing this forces a new resource to be created.

* `resource_group_name` - (Required) The name of the resource group in which to create the Shared Image Gallery. Changing this forces a new resource to be created.

* `location` - (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.

* `description` - (Optional) A description for this Shared Image Gallery.

* `sharing` - (Optional) A `sharing` block as defined below. Changing this forces a new resource to be created.

* `tags` - (Optional) A mapping of tags to assign to the Shared Image Gallery.

---

A `sharing` block supports the following:

* `permission` - (Required) The permission of the Shared Image Gallery when sharing. Possible values are `Community`, `Groups` and `Private`. Changing this forces a new resource to be created.

-> **Note:** This requires that the Preview Feature `Microsoft.Compute/CommunityGalleries` is enabled, see [the documentation](https://learn.microsoft.com/azure/virtual-machines/share-gallery-community?tabs=cli) for more information.

* `community_gallery` - (Optional) A `community_gallery` block as defined below. Changing this forces a new resource to be created.

~> **NOTE:** `community_gallery` must be set when `permission` is set to `Community`.

---

A `community_gallery` block supports the following:

* `eula` - (Required) The End User Licence Agreement for the Shared Image Gallery. Changing this forces a new resource to be created.

* `prefix` - (Required) Prefix of the community public name for the Shared Image Gallery. Changing this forces a new resource to be created.

* `publisher_email` - (Required) Email of the publisher for the Shared Image Gallery. Changing this forces a new resource to be created.

* `publisher_uri` - (Required) URI of the publisher for the Shared Image Gallery. Changing this forces a new resource to be created.

## Outputs

In addition to the Arguments listed above - the following Attributes are exported:

* `id` - The ID of the Shared Image Gallery.

* `unique_name` - The Unique Name for this Shared Image Gallery.

---

A `community_gallery` block exports the following:

* `name` - The community public name of the Shared Image Gallery.
<!-- END_TF_DOCS -->
