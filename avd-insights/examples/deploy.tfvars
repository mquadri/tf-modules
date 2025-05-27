avd_dcr_insights = {
  "test-avd-insight1" = {
    enable_telemetry                                 = false
    monitor_data_collection_rule_resource_group_name = "testavdrg4"
    monitor_data_collection_rule_kind                = "Windows"
    monitor_data_collection_rule_location            = "eastus2"
    monitor_data_collection_rule_name                = "microsoft-avdi-eastus"
    monitor_data_collection_rule_data_flow = [
      {
        destinations = ["testlaw004"]
        streams      = ["Microsoft-Perf", "Microsoft-Event"]
      }
    ]
    monitor_data_collection_rule_destinations = {
      log_analytics = {
        name                  = "testlaw004"
        workspace_resource_id = ""
      }
    }
    monitor_data_collection_rule_data_sources = {
      performance_counter = [
        {
          counter_specifiers            = ["\\LogicalDisk(C:)\\Avg. Disk Queue Length", "\\LogicalDisk(C:)\\Current Disk Queue Length", "\\Memory\\Available Mbytes", "\\Memory\\Page Faults/sec", "\\Memory\\Pages/sec", "\\Memory\\% Committed Bytes In Use", "\\PhysicalDisk(*)\\Avg. Disk Queue Length", "\\PhysicalDisk(*)\\Avg. Disk sec/Read", "\\PhysicalDisk(*)\\Avg. Disk sec/Transfer", "\\PhysicalDisk(*)\\Avg. Disk sec/Write", "\\Processor Information(_Total)\\% Processor Time", "\\User Input Delay per Process(*)\\Max Input Delay", "\\User Input Delay per Session(*)\\Max Input Delay", "\\RemoteFX Network(*)\\Current TCP RTT", "\\RemoteFX Network(*)\\Current UDP Bandwidth"]
          name                          = "perfCounterDataSource10"
          sampling_frequency_in_seconds = 30
          streams                       = ["Microsoft-Perf"]
        },
        {
          counter_specifiers            = ["\\LogicalDisk(C:)\\% Free Space", "\\LogicalDisk(C:)\\Avg. Disk sec/Transfer", "\\Terminal Services(*)\\Active Sessions", "\\Terminal Services(*)\\Inactive Sessions", "\\Terminal Services(*)\\Total Sessions"]
          name                          = "perfCounterDataSource30"
          sampling_frequency_in_seconds = 30
          streams                       = ["Microsoft-Perf"]
        }
      ],
      windows_event_log = [
        {
          name           = "eventLogsDataSource"
          streams        = ["Microsoft-Event"]
          x_path_queries = ["Microsoft-Windows-TerminalServices-RemoteConnectionManager/Admin!*[System[(Level=2 or Level=3 or Level=4 or Level=0)]]", "Microsoft-Windows-TerminalServices-LocalSessionManager/Operational!*[System[(Level=2 or Level=3 or Level=4 or Level=0)]]", "System!*", "Microsoft-FSLogix-Apps/Operational!*[System[(Level=2 or Level=3 or Level=4 or Level=0)]]", "Application!*[System[(Level=2 or Level=3)]]", "Microsoft-FSLogix-Apps/Admin!*[System[(Level=2 or Level=3 or Level=4 or Level=0)]]"]
        }
      ]
    }
    monitor_data_collection_rule_tags = {
      resourcetype        = "user-identity"
      appid               = "ap01"
      appname             = "infra"
      env                 = "dev"
      costcostcenter      = "test"
      costvp              = "VP"
      costappownertech    = "owner"
      costappownermanager = "Manager"
      costbudgetowner     = "budget owner"
      costdivision        = "IT"
      appfunction         = "exmaple general Prod Subscription"
      costbaseline        = "2024"
      costallocation      = "sharedcost"
      monthlybudget       = "1000"
      managed_by          = "own"
      additionalcontext   = "01"
    }
    #VM extension specific setting
    vm_id                             = ""
    vm_name                           = ["avdtestvm846-0"]
    vm_extension_name                 = "AzureMonitorWindowsAgent-1"
    vm_extension_publisher            = "Microsoft.Azure.Monitor"
    vm_extension_type                 = "AzureMonitorWindowsAgent"
    vm_extension_type_version         = "1.22"
    vm_extension_auto_upgrade_enabled = true

    # VM association to data collection specific setting
    vm_association_name = "avdtestvm846-association-0"
  }
}