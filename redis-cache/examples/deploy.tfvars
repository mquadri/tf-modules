# deploy.tfvars
redis_caches = {
  "redis_cache_1" = {
    name                               = "redis-cache-1"
    location                           = "East US"
    resource_group_name                = "rg-redis-east-us"
    capacity                           = 2
    sku_name                           = "Premium"
    access_keys_authentication_enabled = true
    subnet_name                        = "default"
    virtual_network_name               = "test-vnet112"
    subnet_resource_group_name         = "rg"
  },

  "redis_cache_2" = {
    name                = "redis-cache-2"
    location            = "East US"
    resource_group_name = "rg-redis-east-us"
    capacity            = 2
    sku_name            = "Premium"
  }
}

