locals {
  databricks_accountid = "a2e9e74f-1e54-4a73-babc-8f9b3256d73e"

  ncc_eastus2_01_name = "ncc-db-global-eastus2-01"
  ncc_eastus2_01_id   = "201c02de-46e5-4253-81da-298b31d74b97"
  ncc_eastus2_01_subnets = [
    "/subscriptions/23a8c420-c354-43f9-91f5-59d08c6b3dff/resourceGroups/prod-eastus2-snp-1-compute-2/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/31ef391b-7908-48ec-8c74-e432113b607b/resourceGroups/prod-eastus2-snp-1-compute-3/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/56beece1-dbc8-40ca-8520-e1d514fb2ccc/resourceGroups/prod-eastus2-snp-1-compute-8/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/653c13e3-a85b-449b-9d14-e3e9c4b0d391/resourceGroups/prod-eastus2-snp-1-compute-6/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/6c0d042c-6733-4420-a3cc-4175d0439b29/resourceGroups/prod-eastus2-snp-1-compute-4/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-azure-eastus2c2-nephos6/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-azure-eastus2c2-nephos7/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-azure-eastus2c3-nephos3/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-azure-eastus2c3-nephos4/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-eastus2-snp-1-compute-1/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/9d5fffc7-7640-44a1-ba2b-f77ada7731d4/resourceGroups/prod-eastus2-snp-1-compute-5/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/b4f59749-ad17-4573-95ef-cc4c63a45bdf/resourceGroups/prod-eastus2-snp-1-compute-10/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/b96a1dc5-559f-4249-a30c-5b5a98023c45/resourceGroups/prod-eastus2-snp-1-compute-7/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/d31d7397-093d-4cc4-abd6-28b426c0c882/resourceGroups/prod-eastus2-snp-1-compute-9/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet"
  ]

  ncc_centralus_01_name = "ncc-db-global-centralus-01"
  ncc_centralus_01_id   = "8fc5592d-2d1f-4152-a9a7-c6dc1d2be314"
  ncc_centralus_01_subnets = [
    "/subscriptions/23a8c420-c354-43f9-91f5-59d08c6b3dff/resourceGroups/prod-centralus-snp-1-compute-2/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/31ef391b-7908-48ec-8c74-e432113b607b/resourceGroups/prod-centralus-snp-1-compute-3/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/56beece1-dbc8-40ca-8520-e1d514fb2ccc/resourceGroups/prod-centralus-snp-1-compute-8/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/653c13e3-a85b-449b-9d14-e3e9c4b0d391/resourceGroups/prod-centralus-snp-1-compute-6/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/6c0d042c-6733-4420-a3cc-4175d0439b29/resourceGroups/prod-centralus-snp-1-compute-4/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-azure-centralus-nephos10-xr/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-azure-centralus-nephos9-xr/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-centralus-snp-1-compute-1/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/9d5fffc7-7640-44a1-ba2b-f77ada7731d4/resourceGroups/prod-centralus-snp-1-compute-5/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/b4f59749-ad17-4573-95ef-cc4c63a45bdf/resourceGroups/prod-centralus-snp-1-compute-10/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/b96a1dc5-559f-4249-a30c-5b5a98023c45/resourceGroups/prod-centralus-snp-1-compute-7/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet",
    "/subscriptions/d31d7397-093d-4cc4-abd6-28b426c0c882/resourceGroups/prod-centralus-snp-1-compute-9/providers/Microsoft.Network/virtualNetworks/kaas-vnet/subnets/worker-subnet"
  ]

  ncc_northcentralus_01_name = "ncc-db-northcentralus-01"
  ncc_northcentralus_01_id   = "89344fb2-49d0-4db3-b9a4-234e31620495"
  ncc_northcentralus_01_subnets = [
    "/subscriptions/23a8c420-c354-43f9-91f5-59d08c6b3dff/resourceGroups/prod-northcentralus-snp-1-compute-4/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-4/subnets/worker-subnet",
    "/subscriptions/31ef391b-7908-48ec-8c74-e432113b607b/resourceGroups/prod-northcentralus-snp-1-compute-2/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-2/subnets/worker-subnet",
    "/subscriptions/56beece1-dbc8-40ca-8520-e1d514fb2ccc/resourceGroups/prod-northcentralus-snp-1-compute-8/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-8/subnets/worker-subnet",
    "/subscriptions/653c13e3-a85b-449b-9d14-e3e9c4b0d391/resourceGroups/prod-northcentralus-snp-1-compute-6/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-6/subnets/worker-subnet",
    "/subscriptions/6c0d042c-6733-4420-a3cc-4175d0439b29/resourceGroups/prod-northcentralus-snp-1-compute-3/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-3/subnets/worker-subnet",
    "/subscriptions/8453a5d5-9e9e-40c7-87a4-0ab4cc197f48/resourceGroups/prod-northcentralus-snp-1-compute-1/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-1/subnets/worker-subnet",
    "/subscriptions/9d5fffc7-7640-44a1-ba2b-f77ada7731d4/resourceGroups/prod-northcentralus-snp-1-compute-5/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-5/subnets/worker-subnet",
    "/subscriptions/b4f59749-ad17-4573-95ef-cc4c63a45bdf/resourceGroups/prod-northcentralus-snp-1-compute-10/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-10/subnets/worker-subnet",
    "/subscriptions/b96a1dc5-559f-4249-a30c-5b5a98023c45/resourceGroups/prod-northcentralus-snp-1-compute-7/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-7/subnets/worker-subnet",
    "/subscriptions/d31d7397-093d-4cc4-abd6-28b426c0c882/resourceGroups/prod-northcentralus-snp-1-compute-9/providers/Microsoft.Network/virtualNetworks/prod-northcentralus-snp-1-compute-9/subnets/worker-subnet"
  ]

  ncc_name = var.location == "eastus2" ? local.ncc_eastus2_01_name : var.location == "centralus" ? local.ncc_centralus_01_name : local.ncc_northcentralus_01_name

  ncc_id = var.location == "eastus2" ? local.ncc_eastus2_01_id : var.location == "centralus" ? local.ncc_centralus_01_id : local.ncc_northcentralus_01_id

  ncc_subnets = var.location == "eastus2" ? local.ncc_eastus2_01_subnets : var.location == "centralus" ? local.ncc_centralus_01_subnets : local.ncc_northcentralus_01_subnets

}
