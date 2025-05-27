output "shared_image_galleries" {
  description = "Details of all shared image galleries"
  value = {
    for k, v in azurerm_shared_image_gallery.this :
    k => {
      id          = v.id
      unique_name = v.unique_name
      community_gallery = length(v.sharing) > 0 ? (
        v.sharing[0].community_gallery != null ? {
          name = v.sharing[0].community_gallery[0].name
        } : null
      ) : null
    }
  }
}
