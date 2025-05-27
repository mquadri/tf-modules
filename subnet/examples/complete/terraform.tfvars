location                 = "northcentralus"
resourcetype             = "sub"
appname                  = "example-infra"
env                      = "prod"
subscription_id          = "00000000-0000-0000-0000-000000000000"
additionalcontext        = "01"
vnet_resource_group_name = "rg-vnet-exmaple-infra-prod-01"
vnet_name                = "vnet-example-infra-prod-01"
address_prefix           = "148.155.171.192/26"
subnet_delegations = {
  "del-example-prod-01" = {
    name = "Microsoft.Databricks/workspaces",
    actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
      "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action",
    ]
  }
}
service_endpoint_list = ["Microsoft.ContainerRegistry"]


default_outbound_access_enabled = false
nat_gateway = {
  id = "nat-gateway-example-id"
}
network_security_group = {
  id = "network-security-group-example-id"
}
private_endpoint_network_policies             = "Enabled"
private_link_service_network_policies_enabled = true
role_assignments = {
  role1 = {
    principal_id               = "principal1-id"
    role_definition_id_or_name = "role1-name"
  }
}
route_table = {
  id = "route-table-example-id"
}
service_endpoint_policies = {
  policy1 = {
    id = "policy1-id"
  }
}
sharing_scope = "DelegatedServices"
