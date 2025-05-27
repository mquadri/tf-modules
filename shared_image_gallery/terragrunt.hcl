locals {}

inputs = {
shared_image_gallery_config = {
  "gallery1" = {
    name                = "test_gallery_1"
    resource_group_name = "tesing"
    location            = "East US"
    description         = "First shared image gallery"
    tags                = { environment = "production" }

    sharing = {
      permission = "Community"
      community_gallery = {
        eula            = "Example EULA for community gallery"
        prefix          = "community"
        publisher_email = "publisher@example.com"
        publisher_uri   = "https://example.com"
      }
    }
  }

  "gallery2" = {
    name                = "test_gallery_2"
    resource_group_name = "tesing"
    location            = "East US"
    description         = "Second shared image gallery"
    tags                = { environment = "production" }
  }
}

}
