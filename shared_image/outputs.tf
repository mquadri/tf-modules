output "shared_images" {
  description = "Details of all shared images"
  value = {
    for k, v in azurerm_shared_image.this :
    k => {
      id = v.id
    }
  }
}
