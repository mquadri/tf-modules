#Tenant ID
$tenantId = '72b17115-9915-42c0-9f1b-4f98e5a4bcd2'

#Billing Account ID
$billingAccountId = '78358115'

#Enrollment Account Name
$enrollmentAccountName = '222349'
#$enrollmentAccountName='1862b45f-ec19-44d2-8f72-6c96c17af4f1'

#Role to assign to the SPN
$role = "SubscriptionCreator"

#objectId of the SPN
$principalId = "73022605-a545-4176-ace4-b49edd16e20b"

#create a new guid with new-guid command
$randomRoleGuid = new-guid

#Map the role to the role ID
$roleMap = @{
    "EnrollmentReader"    = "24f8edb6-1668-4659-b5e2-40bb5f3a7d7e"
    "EA purchaser"        = "da6647fb-7651-49ee-be91-c43c4877f0c4"
    "DepartmentReader"    = "db609904-a47f-4794-9be8-9bd86fbffd8a"
    "SubscriptionCreator" = "a0bcee42-bf30-4d1b-926a-48d21664ef71"
}

#Connect to the tenant
Connect-AzAccount -Tenant $tenantId

#Get the access token
$token = (Get-AzAccessToken -ResourceUrl 'https://management.core.windows.net/').Token

#Create the role assignment
$body = @{
    "properties" = @{
        "principalId"       = $principalId
        "principalTenantId" = "$tenantId"
        "roleDefinitionId"  = "/providers/Microsoft.Billing/billingAccounts/$billingAccountId/enrollmentAccounts/$enrollmentAccountName/billingRoleDefinitions/$($roleMap.$role)"
    }
} | ConvertTo-Json

$enrollmentUri = "https://management.azure.com/providers/Microsoft.Billing/billingAccounts/$billingAccountId/enrollmentAccounts/$enrollmentAccountName/billingRoleAssignments/$($randomRoleGuid)?api-version=2019-10-01-preview"
#$billingAccountUri = "https://management.azure.com/providers/Microsoft.Billing/billingAccounts/$billingAccountId/billingRoleAssignments/$($randomRoleGuid)?api-version=2019-10-01-preview"

#Set Parameters for REST API call including the access token
$params = @{
    Uri         = $enrollmentUri
    Headers     = @{ 'Authorization' = "Bearer $token" }
    Method      = 'PUT'
    ContentType = 'application/json'
}

#Invoke the REST API
Invoke-RestMethod @params -Body $body