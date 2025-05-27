nsg_association = {
  "nsg-01" = {
    nsg_name                 = "example-nsg"
    nsg_resource_group       = "test-rg"
    subnet_name              = "test"
    vnet_name                = "uaqdevvm01-vnet"
    vnet_resource_group_name = "UAQ-tesing"
  }
  "nsg-02" = {
    nsg_name                 = "example-nsg"
    nsg_resource_group       = "test-rg"
    subnet_name              = "default"
    vnet_name                = "uaqdevvm01-vnet"
    vnet_resource_group_name = "UAQ-tesing"
  }
}
