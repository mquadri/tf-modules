data "azurerm_shared_image_gallery" "this" {
  for_each            = var.shared_image_config != null ? var.shared_image_config : {}
  name                = each.value.gallery_name
  resource_group_name = each.value.gallery_resource_group_name
}

locals {
  mandatory_tags = {
    app_id        = var.app_id
    environment   = var.environment
    msftmigration = var.msftmigration
  }
}

resource "azurerm_shared_image" "this" {
  for_each            = var.shared_image_config != null ? var.shared_image_config : {}
  name                = each.value.name
  gallery_name        = data.azurerm_shared_image_gallery.this[each.key].name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  os_type             = each.value.os_type

  identifier {
    publisher = each.value.identifier.publisher
    offer     = each.value.identifier.offer
    sku       = each.value.identifier.sku
  }

  # Optional attributes
  dynamic "purchase_plan" {
    for_each = each.value.purchase_plan != null ? [each.value.purchase_plan] : []
    content {
      name      = purchase_plan.value.name
      publisher = purchase_plan.value.publisher
      product   = purchase_plan.value.product
    }
  }

  description                         = each.value.description
  disk_types_not_allowed              = each.value.disk_types_not_allowed
  end_of_life_date                    = each.value.end_of_life_date
  eula                                = each.value.eula
  specialized                         = each.value.specialized
  architecture                        = each.value.architecture
  hyper_v_generation                  = each.value.hyper_v_generation
  max_recommended_vcpu_count          = each.value.max_recommended_vcpu_count
  min_recommended_vcpu_count          = each.value.min_recommended_vcpu_count
  max_recommended_memory_in_gb        = each.value.max_recommended_memory_in_gb
  min_recommended_memory_in_gb        = each.value.min_recommended_memory_in_gb
  privacy_statement_uri               = each.value.privacy_statement_uri
  release_note_uri                    = each.value.release_note_uri
  trusted_launch_supported            = each.value.trusted_launch_supported != null ? each.value.trusted_launch_supported : null
  trusted_launch_enabled              = each.value.trusted_launch_enabled != null ? each.value.trusted_launch_enabled : null
  confidential_vm_supported           = each.value.confidential_vm_supported != null ? each.value.confidential_vm_supported : null
  confidential_vm_enabled             = each.value.confidential_vm_enabled != null ? each.value.confidential_vm_enabled : null
  accelerated_network_support_enabled = each.value.accelerated_network_support_enabled
  tags                                = merge(local.mandatory_tags, try(each.value.tags, {}))
}
