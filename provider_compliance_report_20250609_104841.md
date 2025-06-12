# Terraform Module Provider Configuration Compliance Report

**Generated:** 2025-06-09 10:48:41  
**Root Path:** C:\Users\moquadri\workspace\Lumen\LocalTest\tf-modules  
**Total Modules:** 113  
**Compliance Rate:** 60.2%

## Summary

| Status | Count | Percentage |
|--------|-------|------------|
| ✅ Compliant | 68 | 60.2% |
| ⚠️ Partially Compliant | 45 | 39.8% |
| ❌ Non-Compliant | 0 | 0% |

## Module Details

| Module | Status | Provider File | Description | Issues |
|--------|--------|---------------|-------------|--------|
| acr | ✅ COMPLIANT | versions.tf | Recommended (Azure Terraform Module Catalog standard) | - |
| action-groups | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| activity_log_alert | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| adh-compute-hostgroup | ✅ COMPLIANT | versions.tf | Recommended (Azure Terraform Module Catalog standard) | - |
| ai-search | ✅ COMPLIANT | versions.tf | Recommended (Azure Terraform Module Catalog standard) | - |
| ai-studio | ✅ COMPLIANT | versions.tf | Recommended (Azure Terraform Module Catalog standard) | - |
| aks | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| alerts | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| api-management | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| app-gateway | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| app-insight | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| app-service-plan | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| appdynamics | ⚠️ PARTIALLY_COMPLIANT | provider.tf | Minimal pattern | Using non-preferred provider file name |
| availability_sets | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| avd-application-group | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| avd-host-pools | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| avd-insights | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| avd-management-plane | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| avd-scaling-plan | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| avd-workspace | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| avs | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| azure_monitor_workbook | ⚠️ PARTIALLY_COMPLIANT | provider.tf | Minimal pattern | Using non-preferred provider file name |
| azure-bot-service | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| azure-firewall | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| azure-firewall-policy | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| azure-front-door | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| azure-netapp-file | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| backup-protected-file-share | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| bastion-host | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| computer-vision | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| consumption_budget | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| content-safety | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| cosmos-db-account | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| cosmos-sql-db | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| cosmosdb | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| cost-management-export | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| crowdstrike-aks | ⚠️ PARTIALLY_COMPLIANT | required-providers.tf | Alternative with hyphen | Using non-preferred provider file name |
| custom-role-definition | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| custom-vision | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| cvo-azure | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| data_collection_rules | ⚠️ PARTIALLY_COMPLIANT | provider.tf | Minimal pattern | Using non-preferred provider file name |
| data-protection-backup | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| databricks | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| databricks-serverless-compute | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| dataexplorer | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| datafactory | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| diagnostic-setting | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| dns-private-resolver | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| document-intelligence | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| express-route | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| expressroute-circuit | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| expressroute-direct | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| expressroute-peeringerc | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| fabric-capacity | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| function-app | ⚠️ PARTIALLY_COMPLIANT | provider.tf | Minimal pattern | Using non-preferred provider file name |
| hdinsight-spark | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| key-vault | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| key-vault-access-policy | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| language-service | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| load_balancer | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| log-analytics-ws | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| log-analytics-ws-table | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| management-groups | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| nat-gateway | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| network_monitor_connection | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| nsg | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| nsg_association | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| openai | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| palo_alto | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| palo-panorama | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| palovm | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| panorama | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| pim-eligible | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| postgre-sql | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| private-dns-zone | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| private-endpoint | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| private-link-service | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| public-ip-address | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| pure-storage | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| rbac-assignment | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| recovery-services-vault | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| redis-cache | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| reserved-instances | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| resource-groups | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| resource-lock | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| route-table | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| shared_image | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| shared_image_gallery | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| sql_server | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| sql-database | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| sql-managed-database | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| sql-managed-instance | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| sql-server | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| Standard_Tags | ⚠️ PARTIALLY_COMPLIANT | versions.tf | Recommended (Azure Terraform Module Catalog standard) | Missing required_providers block |
| storage-account | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| storage-account-backup-container | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| storage-account-container | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| storage-account-datalake | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| storage-sync | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| subnet | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| subscriptions | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| synapse-analytics | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| user-assigned-identity | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| virtual-wan-hub | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| vm | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| vm-extension | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| vnet | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| vnet-flow-logs | ⚠️ PARTIALLY_COMPLIANT | providers.tf | Legacy pattern | Using non-preferred provider file name |
| waf | ⚠️ PARTIALLY_COMPLIANT | required-providers.tf | Alternative with hyphen | Using non-preferred provider file name |
| waf-frontdoor-classic | ⚠️ PARTIALLY_COMPLIANT | required-providers.tf | Alternative with hyphen | Using non-preferred provider file name |
| web-app | ✅ COMPLIANT | required_providers.tf | Common alternative | - |
| wiz | ⚠️ PARTIALLY_COMPLIANT | required-providers.tf | Alternative with hyphen | Using non-preferred provider file name |
| wiz-broker | ⚠️ PARTIALLY_COMPLIANT | required-providers.tf | Alternative with hyphen | Using non-preferred provider file name |
## Recommendations

### For Non-Compliant Modules
1. Create a ersions.tf file in each module directory
2. Include a 	erraform block with equired_providers
3. Follow the Azure Terraform Module Catalog Criterion standards

### For Partially Compliant Modules
1. Review and address the issues listed above
2. Consider renaming provider files to ersions.tf for consistency
3. Ensure all required provider blocks are properly defined

### Best Practices
- Use ersions.tf as the preferred filename for provider configurations
- Include version constraints for all required providers
- Follow semantic versioning for provider constraints
- Regularly update provider versions for security patches

## Provider File Priority Order
1. ersions.tf - Recommended (Azure Terraform Module Catalog standard)
2. equired_providers.tf - Common alternative
3. equired-providers.tf - Alternative with hyphen
4. providers.tf - Legacy pattern
5. provider.tf - Minimal pattern

---
*Report generated by Terraform Module Provider Configuration Compliance Checker v1.0.0*
