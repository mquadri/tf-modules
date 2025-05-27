<!-- BEGIN_TF_DOCS -->
## Inputs

The following arguments are supported:

* `name` - (Required) The name of the activity log alert. Changing this forces a new resource to be created.

* `resource_group_name` - (Required) The name of the resource group in which to create the activity log alert instance. Changing this forces a new resource to be created.

* `location` - (Required) The Azure Region where the activity log alert rule should exist. Changing this forces a new resource to be created.

* `scopes` - (Required) The scope at which the Activity Log should be applied. A list of strings that could be a resource group, a subscription, or a resource ID (such as a Storage Account).

* `criteria` - (Required) A criteria block as defined below.

* `action` - (Optional) One or more action blocks as defined below.

* `enabled` - (Optional) Specifies whether this Activity Log Alert should be enabled. Defaults to `true`.

* `description` - (Optional) The description of this activity log alert.

* `tags` - (Optional) A mapping of tags to assign to the resource.

### Action Block

The `action` block supports the following:

* `action_group_id` - (Required) The ID of the Action Group.

* `webhook_properties` - (Optional) A map of custom string properties to include with the post operation. These data are appended to the webhook payload.

### Criteria Block

The `criteria` block supports the following:

* `category` - (Required) The category of the operation. Possible values: `Administrative`, `Autoscale`, `Policy`, `Recommendation`, `ResourceHealth`, `Security`, and `ServiceHealth`.

* `caller` - (Optional) The email address or Azure Active Directory identifier of the user who performed the operation.

* `operation_name` - (Optional) The Resource Manager Role-Based Access Control operation name. Supported operation should be in the form `<resourceProvider>/<resourceType>/<operation>`.

* `resource_provider` - (Optional) The name of the resource provider monitored by the activity log alert.

* `resource_providers` - (Optional) A list of names of resource providers monitored by the activity log alert.  
  **Note:** `resource_provider` and `resource_providers` are mutually exclusive.

* `resource_type` - (Optional) The resource type monitored by the activity log alert.

* `resource_types` - (Optional) A list of resource types monitored by the activity log alert.  
  **Note:** `resource_type` and `resource_types` are mutually exclusive.

* `resource_group` - (Optional) The name of the resource group monitored by the activity log alert.

* `resource_groups` - (Optional) A list of names of resource groups monitored by the activity log alert.  
  **Note:** `resource_group` and `resource_groups` are mutually exclusive.

* `resource_id` - (Optional) The specific resource monitored by the activity log alert. It should be within one of the scopes.

* `resource_ids` - (Optional) A list of specific resources monitored by the activity log alert. It should be within one of the scopes.  
  **Note:** `resource_id` and `resource_ids` are mutually exclusive.

* `level` - (Optional) The severity level of the event. Possible values: `Verbose`, `Informational`, `Warning`, `Error`, and `Critical`.

* `levels` - (Optional) A list of severity levels of the event. Possible values: `Verbose`, `Informational`, `Warning`, `Error`, and `Critical`.  
  **Note:** `level` and `levels` are mutually exclusive.

* `status` - (Optional) The status of the event. Example values: `Started`, `Failed`, `Succeeded`.

* `statuses` - (Optional) A list of statuses of the event. Example values: `Started`, `Failed`, `Succeeded`.  
  **Note:** `status` and `statuses` are mutually exclusive.

* `sub_status` - (Optional) The sub-status of the event.

* `sub_statuses` - (Optional) A list of sub-statuses of the event.  
  **Note:** `sub_status` and `sub_statuses` are mutually exclusive.

* `recommendation_type` - (Optional) The recommendation type of the event. Only allowed when `category` is `Recommendation`.

* `recommendation_category` - (Optional) The recommendation category of the event. Possible values: `Cost`, `Reliability`, `OperationalExcellence`, `HighAvailability`, and `Performance`. Only allowed when `category` is `Recommendation`.

* `recommendation_impact` - (Optional) The recommendation impact of the event. Possible values: `High`, `Medium`, `Low`. Only allowed when `category` is `Recommendation`.

### Resource Health Block

The `resource_health` block supports the following:

* `current` - (Optional) The current resource health statuses that will log an alert. Possible values: `Available`, `Degraded`, `Unavailable`, `Unknown`.

* `previous` - (Optional) The previous resource health statuses that will log an alert. Possible values: `Available`, `Degraded`, `Unavailable`, `Unknown`.

* `reason` - (Optional) The reason that will log an alert. Possible values: `PlatformInitiated` (such as a problem with the resource in an affected region of an Azure incident), `UserInitiated` (such as a shutdown request of a VM), and `Unknown`.

### Service Health Block

The `service_health` block supports the following:

* `events` - (Optional) Events this alert will monitor. Possible values: `Incident`, `Maintenance`, `Informational`, `ActionRequired`, `Security`.

* `locations` - (Optional) Locations this alert will monitor. Example: `West Europe`.

* `services` - (Optional) Services this alert will monitor. Example: `Activity Logs & Alerts`, `Action Groups`. Defaults to all services.

## Attributes Reference

In addition to the arguments listed above, the following attributes are exported:

* `id` - The ID of the activity log alert.

<!-- END_TF_DOCS -->
