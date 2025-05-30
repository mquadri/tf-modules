# Example terraform.tfvars for adh-compute-hostgroup test

# Mandatory Tags for the module
app_id        = "APPTEST001"
environment   = "DEV"
msftmigration = "N"
mal_id        = "MALTEST001"

# Custom tags for the module 'tags' variable
tags = {
  CustomTag1 = "TestValue1"
  CostCenter = "CCTEST"
}

# adh-compute-hostgroup specific variables
# Note: resource_group_name and location are handled by the test/main.tf creating its own RG.
# dedicated_host_group_name is also set in test/main.tf directly for this basic test.
# platform_fault_domain_count is set in test/main.tf
# automatic_placement_enabled is set in test/main.tf
# zone is set in test/main.tf
# enable_telemetry is set in test/main.tf
# dedicated_hosts is set in test/main.tf

# If the test/main.tf were to use variables for these, they would be defined here.
# For example:
# dedicated_host_group_name_test   = "tfvars-testadhgroup001"
# platform_fault_domain_count_test = 1
# zone_test                        = "1"
# dedicated_hosts_test = {
#   hosttfvars = {
#     name                    = "tfvarshost01"
#     platform_fault_domain   = 1
#     sku_name                = "DSv3-Type1"
#     auto_replace_on_failure = true
#     license_type            = "None"
#   }
# }
