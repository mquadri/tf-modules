locals {}

inputs = {
shared_image_config = {
  "shared-image-01" = {
    name                        = "test_image_1"
    gallery_name                = "test_gallery_1"
    gallery_resource_group_name = "testing"
    resource_group_name         = "testing"
    location                    = "East US"
    os_type                     = "Linux"
    identifier = {
      offer     = "UbuntuServer"
      publisher = "Canonical"
      sku       = "20.04-LTS"

    }
  }
}
}
