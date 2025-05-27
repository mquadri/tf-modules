resourcetype   = "sub"
appid          = "test"
appname        = "exmaple-infra"
env            = "dev"
costCostCenter = "test"
# costVP                               = "vp"
costAppOwnerTech    = "owner"
costAppOwnerManager = "manager"
costBudgetOwner     = "budget owner"
# management_group_name                = "mg-name"
# costDivision                         = "devision-name"
appFunction             = "exmaple general dev Subscription"
costbaseline            = "2024"
costAllocation          = "sharedcost"
monthlyBudget           = "1000"
data_items = [
  {
    "type" = 1,
    "content" = {
      "json" = "<div style=\"background-color=rgb(26, 0, 51);padding=5px;\">\r\n<h1 style=\"text-align=center;color=white;\">Alert Trend Analysis</h1>\r\n<h3 style=\"text-align=center;color=Aquamarine;\"> &rarr; Choose a tab below to overview Analysis of alerts set for your choice.</h3>\r\n<h4 style=\"text-align=center;color=Lavender\"> &#128202; We have trends based on Subscription, Severity, Location of resources, ResourceType  as per the Time Window. <br>&#128202; We also have the option to look at the alerts as an overview allowing choices customized for all above.<br><u>\r\nChoose custom name Search to look at results with your choice of filter in keyword search.</u>\r\n</h4>\r\n</div>\r\n"
    },
    "name" = "text - 0"
  },
  {
    "type" = 1,
    "content" = {
      "json" = ""
    },
    "name" = "text - 8"
  },
  {
    "type" = 1,
    "content" = {
      "json" = ""
    },
    "customWidth" = "20",
    "name"        = "text - 12 - Copy - Copy"
  },
  {
    "type" = 11,
    "content" = {
      "version" = "LinkItem/1.0",
      "style"   = "tabs",
      "links" = [
        {
          "id"         = "6da44294-2f32-421e-9257-ff98d19c8e6c",
          "cellValue"  = "selectedTab",
          "linkTarget" = "parameter",
          "linkLabel"  = "Overview",
          "subTarget"  = "Overview",
          "style"      = "link"
        },
        {
          "id"         = "f8c554d9-b778-45ab-9b93-048c99dbfc6c",
          "cellValue"  = "selectedTab",
          "linkTarget" = "parameter",
          "linkLabel"  = "Severity Based analysis",
          "subTarget"  = "Sev",
          "style"      = "link"
        },
        {
          "id"         = "b5bcbd80-b1aa-46e8-a8c4-483e7be1aa6d",
          "cellValue"  = "selectedTab",
          "linkTarget" = "parameter",
          "linkLabel"  = "Subscription Based Analysis",
          "subTarget"  = "Subscription",
          "style"      = "link"
        },
        {
          "id"         = "bdccc1ea-8506-4f96-9299-375fdf832c3c",
          "cellValue"  = "selectedTab",
          "linkTarget" = "parameter",
          "linkLabel"  = "Location Based Analysis",
          "subTarget"  = "Location",
          "style"      = "link"
        },
        {
          "id"         = "166a85a1-a024-487d-96b6-fb3ac2b4800e",
          "cellValue"  = "selectedTab",
          "linkTarget" = "parameter",
          "linkLabel"  = "ResourceType Based Analysis",
          "subTarget"  = "ResourceType",
          "style"      = "link"
        },
        {
          "id"         = "1521a3fd-1217-4970-9cc4-f2739db4381f",
          "cellValue"  = "selectedTab",
          "linkTarget" = "parameter",
          "linkLabel"  = "Custom Name Search",
          "subTarget"  = "Custom",
          "style"      = "link"
        }
      ]
    },
    "customWidth" = "80",
    "name"        = "links - 7",
    "styleSettings" = {
      "maxWidth" = "200%"
    }
  },
  {
    "type" = 12,
    "content" = {
      "version"   = "NotebookGroup/1.0",
      "groupType" = "editable",
      "title"     = "Overview",
      "items" = [
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "25",
          "name"        = "text - 2"
        },
        {
          "type" = 9,
          "content" = {
            "version" = "KqlParameterItem/1.0",
            "parameters" = [
              {
                "id"          = "1f74ed9a-e3ed-498d-bd5b-f68f3836a117",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "Subscription",
                "label"       = "Subscriptions",
                "type"        = 6,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "value"       = [],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "includeAll"  = false,
                  "showDefault" = false
                }
              },
              {
                "id"          = "b616a3a3-4271-4208-b1a9-a92a78efed08",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "ResourceGroups",
                "label"       = "Resource groups",
                "type"        = 2,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "Resources\r\n| summarize by resourceGroup\r\n| order by resourceGroup asc\r\n| project id=resourceGroup, resourceGroup",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue" = "*"
                },
                "queryType"    = 1,
                "resourceType" = "microsoft.resourcegraph/resources"
              },
              {
                "id"          = "0e85e0e4-a7e8-4ea8-b291-e444c317843a",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "ResourceTypes",
                "label"       = "Resource types",
                "type"        = 7,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "where \"*\" in ({ResourceGroups}) or resourceGroup in ({ResourceGroups})\r\n| summarize by type\r\n| project type, label=type\r\n",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue" = "*"
                },
                "queryType"    = 1,
                "resourceType" = "microsoft.resourcegraph/resources"
              },
              {
                "id"          = "f60ea0a0-3703-44ca-a59b-df0246423f41",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "Resources",
                "type"        = 5,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "Resources\r\n| where \"*\" in ({ResourceTypes}) or type in~({ResourceTypes})\r\n| where '*' in~({ResourceGroups}) or resourceGroup in~({ResourceGroups}) \r\n| order by name asc\r\n| extend Rank = row_number()\r\n| project value = id, label = name, selected = Rank <= 10, group = resourceGroup",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue"   = "*",
                  "defaultItemsText" = "First 10"
                },
                "queryType"    = 1,
                "resourceType" = "microsoft.resourcegraph/resources"
              },
              {
                "id"         = "015d1a5e-357f-4e01-ac77-598e7b493db0",
                "version"    = "KqlParameterItem/1.0",
                "name"       = "timeRange",
                "label"      = "Time Range",
                "type"       = 4,
                "isRequired" = true,
                "value" = {
                  "durationMs" = 604800000
                },
                "typeSettings" = {
                  "selectableValues" = [
                    {
                      "durationMs" = 300000
                    },
                    {
                      "durationMs" = 900000
                    },
                    {
                      "durationMs" = 1800000
                    },
                    {
                      "durationMs" = 3600000
                    },
                    {
                      "durationMs" = 14400000
                    },
                    {
                      "durationMs" = 43200000
                    },
                    {
                      "durationMs" = 86400000
                    },
                    {
                      "durationMs" = 172800000
                    },
                    {
                      "durationMs" = 259200000
                    },
                    {
                      "durationMs" = 604800000
                    },
                    {
                      "durationMs" = 1209600000
                    },
                    {
                      "durationMs" = 2419200000
                    },
                    {
                      "durationMs" = 2592000000
                    },
                    {
                      "durationMs" = 5184000000
                    },
                    {
                      "durationMs" = 7776000000
                    }
                  ],
                  "allowCustom" = true
                }
              },
              {
                "id"          = "bd6d6075-dc8f-43d3-829f-7e2245a3eb21",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "State",
                "type"        = 2,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "{\"version\"=\"1.0.0\",\"content\"=\"[ \\r\\n    {\\\"id\\\"=\\\"New\\\", \\\"label\\\"= \\\"New\\\"},\\r\\n    {\\\"id\\\"=\\\"Acknowledged\\\", \\\"label\\\"= \\\"Acknowledged\\\"},\\r\\n    {\\\"id\\\"=\\\"Closed\\\", \\\"label\\\"= \\\"Closed\\\"}\\r\\n]\",\"transformers\"=null}",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue" = "*",
                  "showDefault"    = false
                },
                "queryType" = 8
              }
            ],
            "style"        = "formHorizontal",
            "queryType"    = 0,
            "resourceType" = "microsoft.resourcegraph/resources"
          },
          "customWidth" = "50",
          "name"        = "parameters"
        },
        {
          "type" = 12,
          "content" = {
            "version"   = "NotebookGroup/1.0",
            "groupType" = "editable",
            "items" = [
              {
                "type" = 1,
                "content" = {
                  "json" = "<div style=\"background-color=Azure;color=black\"><h2 style=\"text-align=center\">Alert Summary</h2>"
                },
                "name" = "text - 9"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Severity= tostring(properties.essentials.severity)\r\n| extend Type = tostring(properties.essentials.targetResourceType)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n| where \"*\" in ({State}) or State in ({State})\r\n//| extend Sev = toint(substring(Severity, 3))\r\n| extend TimeS = todatetime(properties.essentials.startDateTime)\r\n| summarize Sev1=countif(Severity contains \"1\"), Sev2=countif(Severity contains \"2\"), Sev3=countif(Severity contains \"3\"), Sev4=countif(Severity contains \"4\") by bin(TimeS, 1d)",
                  "size"          = 0,
                  "title"         = "Trend Chart of Alerts Generated per hour accumulated as per time selection",
                  "noDataMessage" = "No Alert Found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "categoricalbar",
                  "chartSettings" = {
                    "showLegend" = true
                  }
                },
                "customWidth" = "100",
                "name"        = "query - 6 - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center;color=rgb(102, 0, 102)\">💡 Select one or more severities to see more information."
                },
                "conditionalVisibility" = {
                  "parameterName" = "Severity",
                  "comparison"    = "isEqualTo"
                },
                "name" = "click to select info"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 2 - Copy - Copy"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n| summarize Count=count(), New=countif(State==\"New\"), \r\nAcknowledged=countif(State==\"Acknowledged\"), \r\nClosed=countif(State==\"Closed\") , Fired=countif(MonitorCondition==\"Fired\") , Resolved=countif(MonitorCondition==\"Resolved\") by Severity=tostring(properties.essentials.severity)\r\n| order by Severity asc",
                  "size"                 = 3,
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportedParameters" = [
                    {
                      "fieldName"     = "Severity",
                      "parameterName" = "Severity",
                      "parameterType" = 1
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "sortBy" = [
                      {
                        "itemKey"   = "Severity",
                        "sortOrder" = 1
                      }
                    ]
                  },
                  "sortBy" = [
                    {
                      "itemKey"   = "Severity",
                      "sortOrder" = 1
                    }
                  ]
                },
                "customWidth" = "50",
                "showPin"     = true,
                "name"        = "Alert Summary"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 2 - Copy - Copy - Copy"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend Severity=tostring(properties.essentials.severity)\r\n| where Severity in ({Severity})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| project AlertId=id, StartTime=todatetime(tostring(properties.essentials.startDateTime)), Severity, State=tostring(properties.essentials.alertState), Name=name, \r\n  TargetResource = tostring(properties.essentials.targetResource), \r\n  MonitorService = tostring(properties.essentials.monitorService), MonitorCondition, SignalType=tostring(properties.essentials.signalType), Description=tostring(properties.essentials.description), subscriptionId\r\n| order by StartTime desc\r\n",
                  "size"          = 0,
                  "title"         = "{$rowCount} {Severity} Alerts",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 18,
                        "formatOptions" = {
                          "thresholdsOptions" = "colors",
                          "thresholdsGrid" = [
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "Fired",
                              "representation" = "redBright",
                              "text"           = "{0}{1}"
                            },
                            {
                              "thresholdValue" = "Resolved",
                              "representation" = "green",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "Default",
                              "thresholdValue" = null,
                              "representation" = "blue",
                              "text"           = "{0}{1}"
                            }
                          ]
                        }
                      },
                      {
                        "columnMatch" = "AlertId",
                        "formatter"   = 5,
                        "formatOptions" = {
                          "linkTarget" = "Resource"
                        }
                      },
                      {
                        "columnMatch" = "StartTime",
                        "formatter"   = 6
                      },
                      {
                        "columnMatch" = "Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      },
                      {
                        "columnMatch" = "Name",
                        "formatter"   = 1,
                        "formatOptions" = {
                          "linkTarget"         = "OpenBlade",
                          "linkIsContextBlade" = true,
                          "bladeOpenContext" = {
                            "bladeName"     = "AlertDetailsTemplateBlade",
                            "extensionName" = "Microsoft_Azure_Monitoring",
                            "bladeParameters" = [
                              {
                                "name"   = "alertId",
                                "source" = "column",
                                "value"  = "AlertId"
                              },
                              {
                                "name"   = "alertName",
                                "source" = "column",
                                "value"  = "Name"
                              },
                              {
                                "name"   = "invokedFrom",
                                "source" = "static",
                                "value"  = "Workbooks"
                              }
                            ]
                          }
                        },
                        "tooltipFormat" = {
                          "tooltip" = "View alert details"
                        }
                      },
                      {
                        "columnMatch" = "TargetResource",
                        "formatter"   = 13,
                        "formatOptions" = {
                          "linkTarget" = "Resource",
                          "subTarget"  = "alerts",
                          "showIcon"   = true
                        }
                      },
                      {
                        "columnMatch" = "MonitorCondition",
                        "formatter"   = 18,
                        "formatOptions" = {
                          "thresholdsOptions" = "icons",
                          "thresholdsGrid" = [
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "Fired",
                              "representation" = "Fired",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "resolved",
                              "representation" = "Resolved",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "Default",
                              "thresholdValue" = null,
                              "representation" = "success",
                              "text"           = "{0}{1}"
                            }
                          ]
                        }
                      },
                      {
                        "columnMatch" = "essentials",
                        "formatter"   = 5,
                        "formatOptions" = {
                          "linkTarget"         = "CellDetails",
                          "linkIsContextBlade" = true
                        }
                      }
                    ],
                    "rowLimit" = 1000,
                    "filter"   = true,
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "MonitorCondition"
                      ],
                      "expandTopLevel" = true
                    }
                  }
                },
                "conditionalVisibility" = {
                  "parameterName" = "Severity",
                  "comparison"    = "isNotEqualTo"
                },
                "showPin" = true,
                "name"    = "Alerts for severity"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 11"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources | where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend Severity=tostring(properties.essentials.severity)\r\n| where Severity in ({Severity})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| summarize Alerts=count(), New=countif(State==\"New\"), \r\nAcknowledged=countif(State==\"Acknowledged\"), \r\nClosed=countif(State==\"Closed\")\r\nby Resource=tostring(properties.essentials.targetResource )\r\n| order by Alerts desc\r\n",
                  "size"                 = 2,
                  "title"                = "{Severity} Alerts by Region",
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportAggregateParts" = true,
                  "exportedParameters" = [
                    {
                      "parameterName" = "Selected",
                      "parameterType" = 1,
                      "quote"         = ""
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "map",
                  "gridSettings" = {
                    "rowLimit" = 1000
                  },
                  "mapSettings" = {
                    "locInfo"           = "AzureResource",
                    "locInfoColumn"     = "Resource",
                    "sizeSettings"      = "Alerts",
                    "sizeAggregation"   = "Sum",
                    "minSize"           = 50,
                    "maxSize"           = 100,
                    "defaultSize"       = 0,
                    "legendMetric"      = "Alerts",
                    "legendAggregation" = "Sum",
                    "itemColorSettings" = {
                      "nodeColorField"   = "Alerts",
                      "colorAggregation" = "Sum",
                      "type"             = "heatmap",
                      "heatmapPalette"   = "greenRed"
                    }
                  }
                },
                "customWidth" = "50",
                "conditionalVisibilities" = [
                  {
                    "parameterName" = "Severity",
                    "comparison"    = "isNotEqualTo"
                  },
                  {
                    "parameterName" = "tab",
                    "comparison"    = "isEqualTo",
                    "value"         = "location"
                  }
                ],
                "showPin" = true,
                "name"    = "Alerts map"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center;color=rgb(0, 128, 96)\">💡 Select one or more regions to see Azure resources with alerts in those regions."
                },
                "conditionalVisibilities" = [
                  {
                    "parameterName" = "Selected",
                    "comparison"    = "isEqualTo"
                  },
                  {
                    "parameterName" = "tab",
                    "comparison"    = "isEqualTo",
                    "value"         = "location"
                  },
                  {
                    "parameterName" = "Severity",
                    "comparison"    = "isNotEqualTo"
                  }
                ],
                "name" = "map selection text"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "{\"version\"=\"1.0.0\",\"content\"=\"[{Selected}]\",\"transformers\"=null}",
                  "size"          = 0,
                  "title"         = "Resources with {Severity} Alerts in the Selected Regions",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 8,
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 13,
                        "formatOptions" = {
                          "linkTarget" = "Resource",
                          "showIcon"   = true
                        }
                      },
                      {
                        "columnMatch" = "regionName",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Resource",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Alerts",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "New",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      },
                      {
                        "columnMatch" = "Acknowledged",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      },
                      {
                        "columnMatch" = "Closed",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      }
                    ],
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "regionName"
                      ],
                      "expandTopLevel" = true,
                      "finalBy"        = "Resource"
                    },
                    "labelSettings" = [
                      {
                        "columnId" = "regionName",
                        "label"    = "Region"
                      }
                    ]
                  }
                },
                "conditionalVisibility" = {
                  "parameterName" = "Selected",
                  "comparison"    = "isNotEqualTo"
                },
                "name" = "selected map items"
              }
            ]
          },
          "conditionalVisibility" = {
            "parameterName" = "Subscription",
            "comparison"    = "isNotEqualTo"
          },
          "name" = "nestedgroup"
        },
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "25",
          "name"        = "text - 2 - Copy"
        }
      ]
    },
    "conditionalVisibility" = {
      "parameterName" = "selectedTab",
      "comparison"    = "isEqualTo",
      "value"         = "Overview"
    },
    "name" = "Overview",
    "styleSettings" = {
      "showBorder" = true
    }
  },
  {
    "type" = 12,
    "content" = {
      "version"   = "NotebookGroup/1.0",
      "groupType" = "editable",
      "title"     = "Sev",
      "items" = [
        {
          "type" = 12,
          "content" = {
            "version"   = "NotebookGroup/1.0",
            "groupType" = "editable",
            "items" = [
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 12"
              },
              {
                "type" = 9,
                "content" = {
                  "version" = "KqlParameterItem/1.0",
                  "parameters" = [
                    {
                      "id"          = "1f74ed9a-e3ed-498d-bd5b-f68f3836a117",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "Subscription",
                      "label"       = "Subscriptions",
                      "type"        = 6,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "value" = [
                        "/subscriptions/e8f108e8-ed26-4c89-a624-9312c1a41005"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "includeAll"  = false,
                        "showDefault" = false
                      }
                    },
                    {
                      "id"          = "b616a3a3-4271-4208-b1a9-a92a78efed08",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "ResourceGroups",
                      "label"       = "Resource groups",
                      "type"        = 2,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "Resources\r\n| summarize by resourceGroup\r\n| order by resourceGroup asc\r\n| project id=resourceGroup, resourceGroup",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "value" = [
                        "value::all"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue" = "*"
                      },
                      "queryType"    = 1,
                      "resourceType" = "microsoft.resourcegraph/resources"
                    },
                    {
                      "id"          = "0e85e0e4-a7e8-4ea8-b291-e444c317843a",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "ResourceTypes",
                      "label"       = "Resource types",
                      "type"        = 7,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "where \"*\" in ({ResourceGroups}) or resourceGroup in ({ResourceGroups})\r\n| summarize by type\r\n| project type, label=type\r\n",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "value" = [
                        "value::all"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue" = "*"
                      },
                      "queryType"    = 1,
                      "resourceType" = "microsoft.resourcegraph/resources"
                    },
                    {
                      "id"          = "f60ea0a0-3703-44ca-a59b-df0246423f41",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "Resources",
                      "type"        = 5,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "Resources\r\n| where \"*\" in ({ResourceTypes}) or type in~({ResourceTypes})\r\n| where '*' in~({ResourceGroups}) or resourceGroup in~({ResourceGroups}) \r\n| order by name asc\r\n| extend Rank = row_number()\r\n| project value = id, label = name, selected = Rank <= 10, group = resourceGroup",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "value" = [
                        "value::all"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue"   = "*",
                        "defaultItemsText" = "First 10"
                      },
                      "queryType"    = 1,
                      "resourceType" = "microsoft.resourcegraph/resources"
                    },
                    {
                      "id"         = "015d1a5e-357f-4e01-ac77-598e7b493db0",
                      "version"    = "KqlParameterItem/1.0",
                      "name"       = "timeRange",
                      "label"      = "Time Range",
                      "type"       = 4,
                      "isRequired" = true,
                      "value" = {
                        "durationMs" = 2592000000
                      },
                      "typeSettings" = {
                        "selectableValues" = [
                          {
                            "durationMs" = 300000
                          },
                          {
                            "durationMs" = 900000
                          },
                          {
                            "durationMs" = 1800000
                          },
                          {
                            "durationMs" = 3600000
                          },
                          {
                            "durationMs" = 14400000
                          },
                          {
                            "durationMs" = 43200000
                          },
                          {
                            "durationMs" = 86400000
                          },
                          {
                            "durationMs" = 172800000
                          },
                          {
                            "durationMs" = 259200000
                          },
                          {
                            "durationMs" = 604800000
                          },
                          {
                            "durationMs" = 1209600000
                          },
                          {
                            "durationMs" = 2419200000
                          },
                          {
                            "durationMs" = 2592000000
                          },
                          {
                            "durationMs" = 5184000000
                          },
                          {
                            "durationMs" = 7776000000
                          }
                        ],
                        "allowCustom" = true
                      }
                    },
                    {
                      "id"          = "bd6d6075-dc8f-43d3-829f-7e2245a3eb21",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "State",
                      "type"        = 2,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "{\"version\"=\"1.0.0\",\"content\"=\"[ \\r\\n    {\\\"id\\\"=\\\"New\\\", \\\"label\\\"= \\\"New\\\"},\\r\\n    {\\\"id\\\"=\\\"Acknowledged\\\", \\\"label\\\"= \\\"Acknowledged\\\"},\\r\\n    {\\\"id\\\"=\\\"Closed\\\", \\\"label\\\"= \\\"Closed\\\"}\\r\\n]\",\"transformers\"=null}",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "value" = [
                        "value::all"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue" = "*",
                        "showDefault"    = false
                      },
                      "queryType" = 8
                    }
                  ],
                  "style"        = "formHorizontal",
                  "queryType"    = 0,
                  "resourceType" = "microsoft.resourcegraph/resources"
                },
                "customWidth" = "50",
                "name"        = "parameters"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 12 - Copy"
              },
              {
                "type" = 3,
                "content" = {
                  "version"             = "KqlItem/1.0",
                  "query"               = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count(), New=countif(State==\"New\"), \r\nAcknowledged=countif(State==\"Acknowledged\"), \r\nClosed=countif(State==\"Closed\") \r\nby Severity=tostring(properties.essentials.severity)\r\n| order by Severity asc",
                  "size"                = 3,
                  "title"               = "Severity Summary",
                  "noDataMessage"       = "No alerts found",
                  "exportFieldName"     = "Severity",
                  "exportParameterName" = "Severity",
                  "queryType"           = 1,
                  "resourceType"        = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "piechart",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000
                  }
                },
                "customWidth" = "33",
                "showPin"     = true,
                "name"        = "Severity Summary"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Severity= tostring(properties.essentials.severity)\r\n| extend Type = tostring(properties.essentials.targetResourceType)\r\n| where \"*\" in ({State}) or State in ({State})\r\n//| extend Sev = toint(substring(Severity, 3))\r\n| extend TimeS = todatetime(properties.essentials.startDateTime)\r\n| summarize Count=count(), Sev1=countif(Severity contains \"1\"), Sev2=countif(Severity contains \"2\"), Sev3=countif(Severity contains \"3\"), Sev4=countif(Severity contains \"4\") by bin(TimeS, 1h)",
                  "size"          = 0,
                  "title"         = "Trend Chart of Severity Alerts Generated per hour accumulated as per time selection",
                  "noDataMessage" = "No Alert Found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "linechart",
                  "chartSettings" = {
                    "showLegend" = true
                  }
                },
                "customWidth" = "66",
                "name"        = "query - 6 - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 7"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count(), New=countif(State==\"New\"), \r\nAcknowledged=countif(State==\"Acknowledged\"), \r\nClosed=countif(State==\"Closed\") \r\nby Severity=tostring(properties.essentials.severity)\r\n| order by Severity asc",
                  "size"          = 3,
                  "title"         = "Severity Summary Count",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "tiles",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000
                  },
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1,
                      "numberFormat" = {
                        "unit" = 0,
                        "options" = {
                          "style"       = "decimal",
                          "useGrouping" = false
                        }
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    },
                    "showBorder" = false
                  }
                },
                "customWidth" = "66",
                "showPin"     = false,
                "name"        = "Severity Summary - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 8"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 9"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n//| extend Signal = tostring(properties.essentials.signalType) \r\n| extend AlertRule = tostring(properties.essentials.alertRule)\r\n| extend Description = tostring(properties.essentials.description)\r\n| extend TargetResource = tostring(properties.essentials.targetResource) \r\n| extend Severity = tostring(properties.essentials.severity)\r\n//| extend MonitorService = tostring(properties.essentials.monitorService)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n//| extend ActionStatusAlert = tostring(properties.essentials.actionStatus.isSurpressed)\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Severity=tostring(properties.essentials.severity)\r\n| extend TimeS= todatetime(properties.essentials.startDateTime)\r\n| extend Sev = toint(substring(Severity,3))\r\n| summarize Count=count() by Severity, subscriptionId,AlertRule, TargetResource, name,Description,  MonitorCondition, bin(TimeS, 1h)\r\n| project Count, Severity,MonitorCondition, subscriptionId,AlertRule, TargetResource, name,Description,  bin(TimeS, 1h)\r\n| order by Severity asc",
                  "size"          = 0,
                  "title"         = "Severity Summary of Alerts Grouped over Subscription per hour",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "table",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "palette"     = "categorical",
                          "aggregation" = "Count"
                        },
                        "numberFormat" = {
                          "unit" = 0,
                          "options" = {
                            "style" = "decimal"
                          }
                        }
                      },
                      {
                        "columnMatch" = "Severity",
                        "formatter"   = 8,
                        "formatOptions" = {
                          "min"     = 0,
                          "max"     = 0,
                          "palette" = "turquoise"
                        }
                      }
                    ],
                    "rowLimit" = 10000,
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "subscriptionId",
                        "Severity"
                      ],
                      "expandTopLevel" = true
                    }
                  },
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1,
                      "numberFormat" = {
                        "unit" = 0,
                        "options" = {
                          "style"       = "decimal",
                          "useGrouping" = false
                        }
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    },
                    "showBorder" = false
                  },
                  "graphSettings" = {
                    "type" = 0,
                    "topContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1
                    },
                    "centerContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 1,
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    }
                  },
                  "chartSettings" = {
                    "xAxis" = "TimeS",
                    "yAxis" = [
                      "Count"
                    ],
                    "group"            = "Severity",
                    "createOtherGroup" = null,
                    "showLegend"       = true
                  }
                },
                "customWidth" = "100",
                "showPin"     = false,
                "name"        = "Severity Summary - Copy - Copy"
              }
            ]
          },
          "name" = "nestedgroup1"
        }
      ]
    },
    "conditionalVisibility" = {
      "parameterName" = "selectedTab",
      "comparison"    = "isEqualTo",
      "value"         = "Sev"
    },
    "name" = "Severitybased",
    "styleSettings" = {
      "showBorder" = true
    }
  },
  {
    "type" = 12,
    "content" = {
      "version"   = "NotebookGroup/1.0",
      "groupType" = "editable",
      "title"     = "Subscription Based",
      "items" = [
        {
          "type" = 12,
          "content" = {
            "version"   = "NotebookGroup/1.0",
            "groupType" = "editable",
            "items" = [
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 12"
              },
              {
                "type" = 9,
                "content" = {
                  "version" = "KqlParameterItem/1.0",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "parameters" = [
                    {
                      "id"          = "1f74ed9a-e3ed-498d-bd5b-f68f3836a117",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "Subscription",
                      "label"       = "Subscriptions",
                      "type"        = 6,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "value" = [
                        "/subscriptions/91551445-652d-4556-a035-1238717264f4"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "includeAll"  = false,
                        "showDefault" = false
                      }
                    },
                    {
                      "id"         = "015d1a5e-357f-4e01-ac77-598e7b493db0",
                      "version"    = "KqlParameterItem/1.0",
                      "name"       = "timeRange",
                      "label"      = "Time Range",
                      "type"       = 4,
                      "isRequired" = true,
                      "value" = {
                        "durationMs" = 2592000000
                      },
                      "typeSettings" = {
                        "selectableValues" = [
                          {
                            "durationMs" = 300000
                          },
                          {
                            "durationMs" = 900000
                          },
                          {
                            "durationMs" = 1800000
                          },
                          {
                            "durationMs" = 3600000
                          },
                          {
                            "durationMs" = 14400000
                          },
                          {
                            "durationMs" = 43200000
                          },
                          {
                            "durationMs" = 86400000
                          },
                          {
                            "durationMs" = 172800000
                          },
                          {
                            "durationMs" = 259200000
                          },
                          {
                            "durationMs" = 604800000
                          },
                          {
                            "durationMs" = 1209600000
                          },
                          {
                            "durationMs" = 2419200000
                          },
                          {
                            "durationMs" = 2592000000
                          },
                          {
                            "durationMs" = 5184000000
                          },
                          {
                            "durationMs" = 7776000000
                          }
                        ],
                        "allowCustom" = true
                      }
                    },
                    {
                      "id"          = "bd6d6075-dc8f-43d3-829f-7e2245a3eb21",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "State",
                      "type"        = 2,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "{\"version\"=\"1.0.0\",\"content\"=\"[ \\r\\n    {\\\"id\\\"=\\\"New\\\", \\\"label\\\"= \\\"New\\\"},\\r\\n    {\\\"id\\\"=\\\"Acknowledged\\\", \\\"label\\\"= \\\"Acknowledged\\\"},\\r\\n    {\\\"id\\\"=\\\"Closed\\\", \\\"label\\\"= \\\"Closed\\\"}\\r\\n]\",\"transformers\"=null}",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "value" = [
                        "value::all"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue" = "*",
                        "showDefault"    = false
                      },
                      "queryType" = 8
                    }
                  ],
                  "style"        = "formHorizontal",
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources"
                },
                "customWidth" = "50",
                "name"        = "parameters"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 12 - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 7"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 7 - Copy"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count() by subscriptionId",
                  "size"          = 3,
                  "title"         = "Subscription Alert Summary",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "piechart",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "labelSettings" = [
                      {
                        "columnId" = "Severity"
                      },
                      {
                        "columnId" = "Count"
                      },
                      {
                        "columnId" = "New"
                      },
                      {
                        "columnId" = "Acknowledged"
                      },
                      {
                        "columnId" = "Closed"
                      }
                    ]
                  }
                },
                "customWidth" = "33",
                "showPin"     = true,
                "name"        = "Severity Summary"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Severity = tostring(properties.essentials.severity)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| extend TimeS = todatetime(properties.essentials.startDateTime)\r\n| summarize Count=count() by subscriptionId, bin(TimeS, 1h)\r\n//| extend TimeS = todatetime(properties.essentials.startDateTime)\r\n//| summarize Count=count(), Sev1=countif(Severity contains \"1\"), Sev2=countif(Severity contains \"2\"), Sev3=countif(Severity contains \"3\"), Sev4=countif(Severity contains \"4\"), New=countif(State==\"New\"), Acknowledged=countif(State==\"Acknowledged\"), Closed=countif(State==\"Closed\") , Fired=countif(MonitorCondition==\"Fired\") , Resolved=countif(MonitorCondition==\"Resolved\") by bin(TimeS, 1h)",
                  "size"          = 3,
                  "title"         = "Alerts Per Subscription Count",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "categoricalbar",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "labelSettings" = [
                      {
                        "columnId" = "Count"
                      }
                    ]
                  },
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "subscriptionId",
                      "formatter"   = 15,
                      "formatOptions" = {
                        "linkTarget" = null
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "style"                    = "decimal",
                          "maximumFractionDigits"    = 2,
                          "maximumSignificantDigits" = 3
                        }
                      }
                    },
                    "showBorder" = false,
                    "rowLimit"   = 100
                  },
                  "chartSettings" = {
                    "showLegend" = true
                  }
                },
                "customWidth" = "66",
                "showPin"     = false,
                "name"        = "Severity Summary - Copy - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center;color=rgb(0, 128, 96)\">💡 Select one or more Subscriptions to see resources with alerts and other details."
                },
                "name" = "text - 1"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 10"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count() by subscriptionId",
                  "size"                 = 3,
                  "title"                = "Alerts Per Subscription Count",
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportedParameters" = [
                    {
                      "fieldName"     = "subscriptionId",
                      "parameterName" = "subscriptionId",
                      "parameterType" = 1
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "tiles",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "labelSettings" = [
                      {
                        "columnId" = "Severity"
                      },
                      {
                        "columnId" = "Count"
                      },
                      {
                        "columnId" = "New"
                      },
                      {
                        "columnId" = "Acknowledged"
                      },
                      {
                        "columnId" = "Closed"
                      }
                    ]
                  },
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "subscriptionId",
                      "formatter"   = 15,
                      "formatOptions" = {
                        "linkTarget" = "Resource"
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "style"                    = "decimal",
                          "maximumFractionDigits"    = 2,
                          "maximumSignificantDigits" = 3
                        }
                      }
                    },
                    "showBorder" = false,
                    "rowLimit"   = 100
                  }
                },
                "customWidth" = "100",
                "showPin"     = false,
                "name"        = "Severity Summary - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 11"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where subscriptionId in ({subscriptionId})\r\n//| extend Signal = tostring(properties.essentials.signalType) \r\n| extend AlertRule = tostring(properties.essentials.alertRule)\r\n| extend Description = tostring(properties.essentials.description)\r\n| extend TargetResource = tostring(properties.essentials.targetResource) \r\n| extend Severity = tostring(properties.essentials.severity)\r\n//| extend MonitorService = tostring(properties.essentials.monitorService)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n//| extend ActionStatusAlert = tostring(properties.essentials.actionStatus.isSurpressed)\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Severity=tostring(properties.essentials.severity)\r\n| extend TimeS= todatetime(properties.essentials.startDateTime)\r\n| extend Sev = toint(substring(Severity,3))\r\n| summarize Count=count() by Severity, TargetResource, subscriptionId, AlertRule, Description, MonitorCondition, bin(TimeS, 1h)\r\n| project subscriptionId, Count, Severity, TargetResource, AlertRule, Description, MonitorCondition, bin(TimeS, 1h)\r\n| order by Severity asc",
                  "size"          = 2,
                  "title"         = "Summary of Alerts Grouped over Subscription per hour with respective counts",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "table",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 8,
                        "formatOptions" = {
                          "palette" = "greenRed"
                        },
                        "numberFormat" = {
                          "unit" = 0,
                          "options" = {
                            "style" = "decimal"
                          }
                        }
                      },
                      {
                        "columnMatch" = "subscriptionId",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 8,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "Severity",
                        "formatter"   = 18,
                        "formatOptions" = {
                          "thresholdsOptions" = "colors",
                          "thresholdsGrid" = [
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "0",
                              "representation" = "blue",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "1",
                              "representation" = "redBright",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "2",
                              "representation" = "orange",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "3",
                              "representation" = "yellow",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "4",
                              "representation" = "lightBlue",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "Default",
                              "thresholdValue" = null,
                              "representation" = "blue",
                              "text"           = "{0}{1}"
                            }
                          ],
                          "aggregation" = "Count"
                        }
                      },
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "subscriptionId"
                      ],
                      "expandTopLevel" = true
                    },
                    "labelSettings" = [
                      {
                        "columnId" = "Count"
                      },
                      {
                        "columnId" = "Severity"
                      }
                    ]
                  },
                  "sortBy" = [],
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1,
                      "numberFormat" = {
                        "unit" = 0,
                        "options" = {
                          "style"       = "decimal",
                          "useGrouping" = false
                        }
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    },
                    "showBorder" = false
                  },
                  "graphSettings" = {
                    "type" = 0,
                    "topContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1
                    },
                    "centerContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 1,
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    }
                  },
                  "chartSettings" = {
                    "xAxis" = "TimeS",
                    "yAxis" = [
                      "Count"
                    ],
                    "group"            = "Severity",
                    "createOtherGroup" = null,
                    "showLegend"       = true
                  }
                },
                "customWidth" = "100",
                "conditionalVisibility" = {
                  "parameterName" = "subscriptionId",
                  "comparison"    = "isNotEqualTo"
                },
                "showPin" = false,
                "name"    = "Severity Summary - Copy - Copy"
              }
            ]
          },
          "name" = "nestedgroup1"
        }
      ]
    },
    "conditionalVisibility" = {
      "parameterName" = "selectedTab",
      "comparison"    = "isEqualTo",
      "value"         = "Subscription"
    },
    "name" = "subsbased - Copy",
    "styleSettings" = {
      "showBorder" = true
    }
  },
  {
    "type" = 12,
    "content" = {
      "version"   = "NotebookGroup/1.0",
      "groupType" = "editable",
      "title"     = "Location",
      "items" = [
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "25",
          "name"        = "text - 2"
        },
        {
          "type" = 9,
          "content" = {
            "version" = "KqlParameterItem/1.0",
            "parameters" = [
              {
                "id"          = "1f74ed9a-e3ed-498d-bd5b-f68f3836a117",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "Subscription",
                "label"       = "Subscriptions",
                "type"        = 6,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "value" = [
                  "/subscriptions/91551445-652d-4556-a035-1238717264f4"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "includeAll"  = false,
                  "showDefault" = false
                }
              },
              {
                "id"          = "b616a3a3-4271-4208-b1a9-a92a78efed08",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "ResourceGroups",
                "label"       = "Resource groups",
                "type"        = 2,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "Resources\r\n| summarize by resourceGroup\r\n| order by resourceGroup asc\r\n| project id=resourceGroup, resourceGroup",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue" = "*"
                },
                "queryType"    = 1,
                "resourceType" = "microsoft.resourcegraph/resources"
              },
              {
                "id"          = "0e85e0e4-a7e8-4ea8-b291-e444c317843a",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "ResourceTypes",
                "label"       = "Resource types",
                "type"        = 7,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "where \"*\" in ({ResourceGroups}) or resourceGroup in ({ResourceGroups})\r\n| summarize by type\r\n| project type, label=type\r\n",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue" = "*"
                },
                "queryType"    = 1,
                "resourceType" = "microsoft.resourcegraph/resources"
              },
              {
                "id"          = "f60ea0a0-3703-44ca-a59b-df0246423f41",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "Resources",
                "type"        = 5,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "Resources\r\n| where \"*\" in ({ResourceTypes}) or type in~({ResourceTypes})\r\n| where '*' in~({ResourceGroups}) or resourceGroup in~({ResourceGroups}) \r\n| order by name asc\r\n| extend Rank = row_number()\r\n| project value = id, label = name, selected = Rank <= 10, group = resourceGroup",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue"   = "*",
                  "defaultItemsText" = "First 10"
                },
                "queryType"    = 1,
                "resourceType" = "microsoft.resourcegraph/resources"
              },
              {
                "id"         = "015d1a5e-357f-4e01-ac77-598e7b493db0",
                "version"    = "KqlParameterItem/1.0",
                "name"       = "timeRange",
                "label"      = "Time Range",
                "type"       = 4,
                "isRequired" = true,
                "value" = {
                  "durationMs" = 2592000000
                },
                "typeSettings" = {
                  "selectableValues" = [
                    {
                      "durationMs" = 300000
                    },
                    {
                      "durationMs" = 900000
                    },
                    {
                      "durationMs" = 1800000
                    },
                    {
                      "durationMs" = 3600000
                    },
                    {
                      "durationMs" = 14400000
                    },
                    {
                      "durationMs" = 43200000
                    },
                    {
                      "durationMs" = 86400000
                    },
                    {
                      "durationMs" = 172800000
                    },
                    {
                      "durationMs" = 259200000
                    },
                    {
                      "durationMs" = 604800000
                    },
                    {
                      "durationMs" = 1209600000
                    },
                    {
                      "durationMs" = 2419200000
                    },
                    {
                      "durationMs" = 2592000000
                    },
                    {
                      "durationMs" = 5184000000
                    },
                    {
                      "durationMs" = 7776000000
                    }
                  ],
                  "allowCustom" = true
                }
              },
              {
                "id"          = "bd6d6075-dc8f-43d3-829f-7e2245a3eb21",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "State",
                "type"        = 2,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "query"       = "{\"version\"=\"1.0.0\",\"content\"=\"[ \\r\\n    {\\\"id\\\"=\\\"New\\\", \\\"label\\\"= \\\"New\\\"},\\r\\n    {\\\"id\\\"=\\\"Acknowledged\\\", \\\"label\\\"= \\\"Acknowledged\\\"},\\r\\n    {\\\"id\\\"=\\\"Closed\\\", \\\"label\\\"= \\\"Closed\\\"}\\r\\n]\",\"transformers\"=null}",
                "crossComponentResources" = [
                  "{Subscription}"
                ],
                "value" = [
                  "value::all"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "selectAllValue" = "*",
                  "showDefault"    = false
                },
                "queryType" = 8
              }
            ],
            "style"        = "formHorizontal",
            "queryType"    = 0,
            "resourceType" = "microsoft.resourcegraph/resources"
          },
          "customWidth" = "50",
          "name"        = "parameters"
        },
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "25",
          "name"        = "text - 2 - Copy"
        },
        {
          "type" = 12,
          "content" = {
            "version"   = "NotebookGroup/1.0",
            "groupType" = "editable",
            "items" = [
              {
                "type" = 1,
                "content" = {
                  "json" = "<h2 style=\"text-align=center\">Choose a Severity to drill down the Location view<h2>"
                },
                "name" = "text - 7"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "27",
                "name"        = "text - 6"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count() by Severity=tostring(properties.essentials.severity), location\r\n| order by Severity asc",
                  "size"                 = 3,
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportedParameters" = [
                    {
                      "fieldName"     = "Severity",
                      "parameterName" = "Severity",
                      "parameterType" = 1
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "tiles",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "labelSettings" = [
                      {
                        "columnId" = "Severity"
                      },
                      {
                        "columnId" = "Count"
                      }
                    ]
                  },
                  "tileSettings" = {
                    "showBorder" = false,
                    "titleContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    }
                  }
                },
                "customWidth" = "70",
                "showPin"     = true,
                "name"        = "Alert Summary"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 11"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources | where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend Severity=tostring(properties.essentials.severity)\r\n| where Severity in ({Severity})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({Resources}) or properties.essentials.targetResource in~ ({Resources})\r\n| summarize Alerts=count(), New=countif(State==\"New\"), \r\nAcknowledged=countif(State==\"Acknowledged\"), \r\nClosed=countif(State==\"Closed\")\r\nby Resource=tostring(properties.essentials.targetResource )\r\n| order by Alerts desc\r\n",
                  "size"                 = 2,
                  "title"                = "{Severity} Alerts by Region",
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportAggregateParts" = true,
                  "exportedParameters" = [
                    {
                      "parameterName" = "Selected",
                      "parameterType" = 1,
                      "quote"         = ""
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "map",
                  "gridSettings" = {
                    "rowLimit" = 1000
                  },
                  "mapSettings" = {
                    "locInfo"           = "AzureResource",
                    "locInfoColumn"     = "Resource",
                    "sizeSettings"      = "Alerts",
                    "sizeAggregation"   = "Sum",
                    "minSize"           = 80,
                    "maxSize"           = 100,
                    "defaultSize"       = 0,
                    "legendMetric"      = "Alerts",
                    "legendAggregation" = "Sum",
                    "itemColorSettings" = {
                      "nodeColorField"   = "Alerts",
                      "colorAggregation" = "Sum",
                      "type"             = "heatmap",
                      "heatmapPalette"   = "greenRed"
                    }
                  }
                },
                "customWidth" = "50",
                "conditionalVisibility" = {
                  "parameterName" = "Severity",
                  "comparison"    = "isNotEqualTo"
                },
                "showPin" = true,
                "name"    = "Alerts map"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center;color=rgb(0, 128, 96)\">💡 Select one or more regions to see Azure resources with alerts in those regions."
                },
                "name" = "text - 6"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center\">Resources with {Severity} Alerts in the Selected Regions"
                },
                "conditionalVisibility" = {
                  "parameterName" = "Selected",
                  "comparison"    = "isNotEqualTo"
                },
                "name" = "text - 7"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 8"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "{\"version\"=\"1.0.0\",\"content\"=\"[{Selected}]\",\"transformers\"=null}",
                  "size"          = 0,
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 8,
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 13,
                        "formatOptions" = {
                          "linkTarget" = "Resource",
                          "showIcon"   = true
                        }
                      },
                      {
                        "columnMatch" = "regionName",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Resource",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Alerts",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "New",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      },
                      {
                        "columnMatch" = "Acknowledged",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      },
                      {
                        "columnMatch" = "Closed",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      }
                    ],
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "regionName"
                      ],
                      "expandTopLevel" = true,
                      "finalBy"        = "Resource"
                    },
                    "labelSettings" = [
                      {
                        "columnId" = "regionName",
                        "label"    = "Region"
                      },
                      {
                        "columnId" = "Resource"
                      },
                      {
                        "columnId" = "Alerts"
                      },
                      {
                        "columnId" = "New"
                      },
                      {
                        "columnId" = "Acknowledged"
                      },
                      {
                        "columnId" = "Closed"
                      }
                    ]
                  }
                },
                "customWidth" = "50",
                "conditionalVisibility" = {
                  "parameterName" = "Selected",
                  "comparison"    = "isNotEqualTo"
                },
                "name" = "selected map items"
              }
            ]
          },
          "conditionalVisibility" = {
            "parameterName" = "Subscription",
            "comparison"    = "isNotEqualTo"
          },
          "name" = "nestedgroup"
        }
      ]
    },
    "conditionalVisibility" = {
      "parameterName" = "selectedTab",
      "comparison"    = "isEqualTo",
      "value"         = "Location"
    },
    "name" = "Location",
    "styleSettings" = {
      "showBorder" = true
    }
  },
  {
    "type" = 12,
    "content" = {
      "version"   = "NotebookGroup/1.0",
      "groupType" = "editable",
      "title"     = "Type Based",
      "items" = [
        {
          "type" = 12,
          "content" = {
            "version"   = "NotebookGroup/1.0",
            "groupType" = "editable",
            "items" = [
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 12"
              },
              {
                "type" = 9,
                "content" = {
                  "version" = "KqlParameterItem/1.0",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "parameters" = [
                    {
                      "id"          = "1f74ed9a-e3ed-498d-bd5b-f68f3836a117",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "Subscription",
                      "label"       = "Subscriptions",
                      "type"        = 6,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "value" = [
                        "/subscriptions/91551445-652d-4556-a035-1238717264f4"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "includeAll"  = false,
                        "showDefault" = false
                      }
                    },
                    {
                      "id"          = "b616a3a3-4271-4208-b1a9-a92a78efed08",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "ResourceGroups",
                      "label"       = "Resource groups",
                      "type"        = 2,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "Resources\r\n| summarize by resourceGroup\r\n| order by resourceGroup asc\r\n| project id=resourceGroup, resourceGroup",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "isHiddenWhenLocked" = true,
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue" = "*",
                        "showDefault"    = false
                      },
                      "defaultValue" = "value::all",
                      "queryType"    = 1,
                      "resourceType" = "microsoft.resourcegraph/resources"
                    },
                    {
                      "id"          = "0e85e0e4-a7e8-4ea8-b291-e444c317843a",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "ResourceTypes",
                      "label"       = "Resource types",
                      "type"        = 7,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "where \"*\" in ({ResourceGroups}) or resourceGroup in ({ResourceGroups})\r\n| summarize by type\r\n| project type, label=type\r\n",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "value" = [
                        "value::all"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue" = "*",
                        "showDefault"    = false
                      },
                      "defaultValue" = "value::all",
                      "queryType"    = 1,
                      "resourceType" = "microsoft.resourcegraph/resources"
                    },
                    {
                      "id"         = "015d1a5e-357f-4e01-ac77-598e7b493db0",
                      "version"    = "KqlParameterItem/1.0",
                      "name"       = "timeRange",
                      "label"      = "Time Range",
                      "type"       = 4,
                      "isRequired" = true,
                      "value" = {
                        "durationMs" = 2592000000
                      },
                      "typeSettings" = {
                        "selectableValues" = [
                          {
                            "durationMs" = 300000
                          },
                          {
                            "durationMs" = 900000
                          },
                          {
                            "durationMs" = 1800000
                          },
                          {
                            "durationMs" = 3600000
                          },
                          {
                            "durationMs" = 14400000
                          },
                          {
                            "durationMs" = 43200000
                          },
                          {
                            "durationMs" = 86400000
                          },
                          {
                            "durationMs" = 172800000
                          },
                          {
                            "durationMs" = 259200000
                          },
                          {
                            "durationMs" = 604800000
                          },
                          {
                            "durationMs" = 1209600000
                          },
                          {
                            "durationMs" = 2419200000
                          },
                          {
                            "durationMs" = 2592000000
                          },
                          {
                            "durationMs" = 5184000000
                          },
                          {
                            "durationMs" = 7776000000
                          }
                        ],
                        "allowCustom" = true
                      }
                    },
                    {
                      "id"          = "bd6d6075-dc8f-43d3-829f-7e2245a3eb21",
                      "version"     = "KqlParameterItem/1.0",
                      "name"        = "State",
                      "type"        = 2,
                      "isRequired"  = true,
                      "multiSelect" = true,
                      "quote"       = "'",
                      "delimiter"   = ",",
                      "query"       = "{\"version\"=\"1.0.0\",\"content\"=\"[ \\r\\n    {\\\"id\\\"=\\\"New\\\", \\\"label\\\"= \\\"New\\\"},\\r\\n    {\\\"id\\\"=\\\"Acknowledged\\\", \\\"label\\\"= \\\"Acknowledged\\\"},\\r\\n    {\\\"id\\\"=\\\"Closed\\\", \\\"label\\\"= \\\"Closed\\\"}\\r\\n]\",\"transformers\"=null}",
                      "crossComponentResources" = [
                        "{Subscription}"
                      ],
                      "value" = [
                        "value::all"
                      ],
                      "typeSettings" = {
                        "additionalResourceOptions" = [
                          "value::all"
                        ],
                        "selectAllValue" = "*",
                        "showDefault"    = false
                      },
                      "queryType" = 8
                    }
                  ],
                  "style"        = "formHorizontal",
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources"
                },
                "customWidth" = "50",
                "name"        = "parameters"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 12 - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 7"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 7 - Copy"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Type=tostring(properties.essentials.targetResourceType)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count() by Type",
                  "size"          = 3,
                  "title"         = "Resource Type wise Alert Summary",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "piechart",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "labelSettings" = [
                      {
                        "columnId" = "Severity"
                      },
                      {
                        "columnId" = "Count"
                      },
                      {
                        "columnId" = "New"
                      },
                      {
                        "columnId" = "Acknowledged"
                      },
                      {
                        "columnId" = "Closed"
                      }
                    ]
                  }
                },
                "customWidth" = "33",
                "showPin"     = true,
                "name"        = "Severity Summary"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Type=tostring(properties.essentials.targetResourceType)\r\n| extend TimeS = todatetime(properties.essentials.startDateTime)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count(), Compute_Alerts=countif(Type contains \"compute\"), Storage_Alerts=countif(Type contains \"storage\") ,Network_Alerts=countif(Type contains \"network\"), SQL_Alerts=countif(Type contains \"sql\"), Web_Alerts=countif(Type contains \"web\") , Workspace_Alerts=countif(Type contains \"workspace\") by bin(TimeS, 1h)",
                  "size"                 = 3,
                  "title"                = "Alert Per Resource Type Trend",
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportedParameters" = [
                    {
                      "fieldName"     = "Type",
                      "parameterName" = "Type",
                      "parameterType" = 1
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "linechart",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "labelSettings" = [
                      {
                        "columnId" = "Severity"
                      },
                      {
                        "columnId" = "Count"
                      },
                      {
                        "columnId" = "New"
                      },
                      {
                        "columnId" = "Acknowledged"
                      },
                      {
                        "columnId" = "Closed"
                      }
                    ]
                  },
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "Type",
                      "formatter"   = 1
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "style"                    = "decimal",
                          "maximumFractionDigits"    = 2,
                          "maximumSignificantDigits" = 3
                        }
                      }
                    },
                    "showBorder" = true,
                    "size"       = "auto"
                  },
                  "chartSettings" = {
                    "showLegend" = true
                  }
                },
                "customWidth" = "66",
                "showPin"     = false,
                "name"        = "Severity Summary - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center;color=rgb(0, 128, 96)\">💡 Select one or more Types to see resources with alerts and other details."
                },
                "name" = "text - 1"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Type=tostring(properties.essentials.targetResourceType)\r\n| where \"*\" in ({State}) or State in ({State})\r\n| summarize Count=count() by Type",
                  "size"                 = 3,
                  "title"                = "Alert Per Resource Type Count",
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportedParameters" = [
                    {
                      "fieldName"     = "Type",
                      "parameterName" = "Type",
                      "parameterType" = 1
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "tiles",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "labelSettings" = [
                      {
                        "columnId" = "Severity"
                      },
                      {
                        "columnId" = "Count"
                      },
                      {
                        "columnId" = "New"
                      },
                      {
                        "columnId" = "Acknowledged"
                      },
                      {
                        "columnId" = "Closed"
                      }
                    ]
                  },
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "Type",
                      "formatter"   = 16,
                      "formatOptions" = {
                        "showIcon" = true
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "style"                    = "decimal",
                          "maximumFractionDigits"    = 2,
                          "maximumSignificantDigits" = 3
                        }
                      }
                    },
                    "showBorder" = false,
                    "size"       = "auto"
                  }
                },
                "customWidth" = "100",
                "showPin"     = false,
                "name"        = "Severity Summary - Copy - Copy"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where \"*\" in ({ResourceGroups}) or properties.essentials.targetResourceGroup in~ ({ResourceGroups})\r\n| where \"*\" in ({ResourceTypes}) or properties.essentials.targetResourceType in~ ({ResourceTypes})\r\n//| extend Signal = tostring(properties.essentials.signalType) \r\n| extend AlertRule = tostring(properties.essentials.alertRule)\r\n//| extend Description = tostring(properties.essentials.description)\r\n| extend TargetResource = tostring(properties.essentials.targetResource)\r\n| extend Type=tostring(properties.essentials.targetResourceType) \r\n| where Type in ({Type})\r\n| extend Severity = tostring(properties.essentials.severity)\r\n//| extend MonitorService = tostring(properties.essentials.monitorService)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n//| extend ActionStatusAlert = tostring(properties.essentials.actionStatus.isSurpressed)\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Severity=tostring(properties.essentials.severity)\r\n| extend TimeS= todatetime(properties.essentials.startDateTime)\r\n| extend Sev = toint(substring(Severity,3))\r\n| summarize Count=count() by Severity,TargetResource , Type, AlertRule, MonitorCondition, bin(TimeS, 1h), subscriptionId\r\n| order by Severity asc",
                  "size"          = 2,
                  "title"         = "Summary of Alerts Grouped over Type per hour with respective counts",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "table",
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 8,
                        "formatOptions" = {
                          "palette" = "greenRed"
                        },
                        "numberFormat" = {
                          "unit" = 0,
                          "options" = {
                            "style" = "decimal"
                          }
                        }
                      },
                      {
                        "columnMatch" = "Severity",
                        "formatter"   = 18,
                        "formatOptions" = {
                          "thresholdsOptions" = "colors",
                          "thresholdsGrid" = [
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "0",
                              "representation" = "blue",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "1",
                              "representation" = "redBright",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "2",
                              "representation" = "orange",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "3",
                              "representation" = "yellow",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "4",
                              "representation" = "lightBlue",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "Default",
                              "thresholdValue" = null,
                              "representation" = "blue",
                              "text"           = "{0}{1}"
                            }
                          ],
                          "aggregation" = "Count"
                        }
                      },
                      {
                        "columnMatch" = "Type",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 8,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000,
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "Type"
                      ],
                      "expandTopLevel" = true
                    },
                    "labelSettings" = [
                      {
                        "columnId" = "Severity"
                      },
                      {
                        "columnId" = "Count"
                      }
                    ]
                  },
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1,
                      "numberFormat" = {
                        "unit" = 0,
                        "options" = {
                          "style"       = "decimal",
                          "useGrouping" = false
                        }
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    },
                    "showBorder" = false
                  },
                  "graphSettings" = {
                    "type" = 0,
                    "topContent" = {
                      "columnMatch" = "Severity",
                      "formatter"   = 1
                    },
                    "centerContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 1,
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    }
                  },
                  "chartSettings" = {
                    "xAxis" = "TimeS",
                    "yAxis" = [
                      "Count"
                    ],
                    "group"            = "Severity",
                    "createOtherGroup" = null,
                    "showLegend"       = true
                  }
                },
                "customWidth" = "100",
                "conditionalVisibility" = {
                  "parameterName" = "Type",
                  "comparison"    = "isNotEqualTo"
                },
                "showPin" = false,
                "name"    = "Severity Summary - Copy - Copy"
              }
            ]
          },
          "name" = "nestedgroup1"
        }
      ]
    },
    "conditionalVisibility" = {
      "parameterName" = "selectedTab",
      "comparison"    = "isEqualTo",
      "value"         = "ResourceType"
    },
    "name" = "subsbased - Copy - Copy",
    "styleSettings" = {
      "showBorder" = true
    }
  },
  {
    "type" = 12,
    "content" = {
      "version"   = "NotebookGroup/1.0",
      "groupType" = "editable",
      "title"     = "Custom",
      "items" = [
        {
          "type" = 1,
          "content" = {
            "json" = "<div style=\"background-color=MistyRose;padding=5px\"><h3 style=\"text-align=center;color=FireBrick\">Enter a text below to modify the search as per keywords in name of alert.</h3><h4 style=\"text-align=center;color=MidnightBlue\">You can choose to enter keywords like 'AME', 'Storage' or 'VM' without quotes and have an overview if any alerts that got fired or resolved contains that keywords</h4>"
          },
          "name" = "text - 9"
        },
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "24.25",
          "name"        = "text - 2 - Copy"
        },
        {
          "type" = 9,
          "content" = {
            "version" = "KqlParameterItem/1.0",
            "parameters" = [
              {
                "id"      = "b9f170aa-b3e4-46df-9d32-3ae6d56c3bf3",
                "version" = "KqlParameterItem/1.0",
                "name"    = "Custom",
                "label"   = "Keyword Search",
                "type"    = 1,
                "value"   = "AME",
                "timeContext" = {
                  "durationMs" = 86400000
                }
              }
            ],
            "style"        = "formHorizontal",
            "queryType"    = 0,
            "resourceType" = "microsoft.operationalinsights/workspaces"
          },
          "customWidth" = "50.5",
          "name"        = "parameters - 4"
        },
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "25",
          "name"        = "text - 2"
        },
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "25",
          "name"        = "text - 2 - Copy"
        },
        {
          "type" = 9,
          "content" = {
            "version" = "KqlParameterItem/1.0",
            "parameters" = [
              {
                "id"          = "1f74ed9a-e3ed-498d-bd5b-f68f3836a117",
                "version"     = "KqlParameterItem/1.0",
                "name"        = "Subscription",
                "label"       = "Subscriptions",
                "type"        = 6,
                "isRequired"  = true,
                "multiSelect" = true,
                "quote"       = "'",
                "delimiter"   = ",",
                "value" = [
                  "/subscriptions/91551445-652d-4556-a035-1238717264f4"
                ],
                "typeSettings" = {
                  "additionalResourceOptions" = [
                    "value::all"
                  ],
                  "includeAll"  = false,
                  "showDefault" = false
                }
              },
              {
                "id"         = "015d1a5e-357f-4e01-ac77-598e7b493db0",
                "version"    = "KqlParameterItem/1.0",
                "name"       = "timeRange",
                "label"      = "Time Range",
                "type"       = 4,
                "isRequired" = true,
                "value" = {
                  "durationMs" = 2592000000
                },
                "typeSettings" = {
                  "selectableValues" = [
                    {
                      "durationMs" = 300000
                    },
                    {
                      "durationMs" = 900000
                    },
                    {
                      "durationMs" = 1800000
                    },
                    {
                      "durationMs" = 3600000
                    },
                    {
                      "durationMs" = 14400000
                    },
                    {
                      "durationMs" = 43200000
                    },
                    {
                      "durationMs" = 86400000
                    },
                    {
                      "durationMs" = 172800000
                    },
                    {
                      "durationMs" = 259200000
                    },
                    {
                      "durationMs" = 604800000
                    },
                    {
                      "durationMs" = 1209600000
                    },
                    {
                      "durationMs" = 2419200000
                    },
                    {
                      "durationMs" = 2592000000
                    },
                    {
                      "durationMs" = 5184000000
                    },
                    {
                      "durationMs" = 7776000000
                    }
                  ],
                  "allowCustom" = true
                }
              }
            ],
            "style"        = "formHorizontal",
            "queryType"    = 0,
            "resourceType" = "microsoft.operationalinsights/workspaces"
          },
          "customWidth" = "50",
          "name"        = "parameters"
        },
        {
          "type" = 1,
          "content" = {
            "json" = ""
          },
          "customWidth" = "25",
          "name"        = "text - 2 - Copy"
        },
        {
          "type" = 12,
          "content" = {
            "version"   = "NotebookGroup/1.0",
            "groupType" = "editable",
            "items" = [
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 2 - Copy - Copy"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}\r\n| where name contains_cs \"{Custom}\"\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n| summarize Count=count(), New=countif(State==\"New\"), Acknowledged=countif(State==\"Acknowledged\"), Closed=countif(State==\"Closed\") , Fired=countif(MonitorCondition==\"Fired\"), Resolved=countif(MonitorCondition==\"Resolved\") by Severity=tostring(properties.essentials.severity)\r\n| order by Severity asc",
                  "size"                 = 3,
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportedParameters" = [
                    {
                      "fieldName"     = "Severity",
                      "parameterName" = "Severity",
                      "parameterType" = 1
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "<b>Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      }
                    ],
                    "rowLimit" = 1000
                  }
                },
                "customWidth" = "50",
                "showPin"     = true,
                "name"        = "Alert Summary"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 2 - Copy - Copy - Copy"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center;color=rgb(102, 0, 102)\">💡 Select one or more severities to see more information."
                },
                "name" = "click to select info"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend Severity=tostring(properties.essentials.severity)\r\n| where Severity in ({Severity})\r\n| where name contains_cs \"{Custom}\"\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n| project AlertId=id, StartTime=todatetime(tostring(properties.essentials.startDateTime)), Severity, State=tostring(properties.essentials.alertState), Name=name, \r\n  TargetResource = tostring(properties.essentials.targetResource), \r\n  MonitorService = tostring(properties.essentials.monitorService), MonitorCondition, SignalType=tostring(properties.essentials.signalType), Description=tostring(properties.essentials.description), subscriptionId\r\n| order by StartTime desc\r\n",
                  "size"          = 0,
                  "title"         = "{$rowCount} {Severity} Alerts",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 18,
                        "formatOptions" = {
                          "thresholdsOptions" = "colors",
                          "thresholdsGrid" = [
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "Fired",
                              "representation" = "redBright",
                              "text"           = "{0}{1}"
                            },
                            {
                              "thresholdValue" = "Resolved",
                              "representation" = "green",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "Default",
                              "thresholdValue" = null,
                              "representation" = "blue",
                              "text"           = "{0}{1}"
                            }
                          ]
                        }
                      },
                      {
                        "columnMatch" = "AlertId",
                        "formatter"   = 5,
                        "formatOptions" = {
                          "linkTarget" = "Resource"
                        }
                      },
                      {
                        "columnMatch" = "StartTime",
                        "formatter"   = 6
                      },
                      {
                        "columnMatch" = "Severity",
                        "formatter"   = 11
                      },
                      {
                        "columnMatch" = "State",
                        "formatter"   = 1
                      },
                      {
                        "columnMatch" = "Name",
                        "formatter"   = 1,
                        "formatOptions" = {
                          "linkTarget"         = "OpenBlade",
                          "linkIsContextBlade" = true,
                          "bladeOpenContext" = {
                            "bladeName"     = "AlertDetailsTemplateBlade",
                            "extensionName" = "Microsoft_Azure_Monitoring",
                            "bladeParameters" = [
                              {
                                "name"   = "alertId",
                                "source" = "column",
                                "value"  = "AlertId"
                              },
                              {
                                "name"   = "alertName",
                                "source" = "column",
                                "value"  = "Name"
                              },
                              {
                                "name"   = "invokedFrom",
                                "source" = "static",
                                "value"  = "Workbooks"
                              }
                            ]
                          }
                        },
                        "tooltipFormat" = {
                          "tooltip" = "View alert details"
                        }
                      },
                      {
                        "columnMatch" = "TargetResource",
                        "formatter"   = 13,
                        "formatOptions" = {
                          "linkTarget" = "Resource",
                          "subTarget"  = "alerts",
                          "showIcon"   = true
                        }
                      },
                      {
                        "columnMatch" = "MonitorCondition",
                        "formatter"   = 18,
                        "formatOptions" = {
                          "thresholdsOptions" = "icons",
                          "thresholdsGrid" = [
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "Fired",
                              "representation" = "Fired",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "contains",
                              "thresholdValue" = "resolved",
                              "representation" = "Resolved",
                              "text"           = "{0}{1}"
                            },
                            {
                              "operator"       = "Default",
                              "thresholdValue" = null,
                              "representation" = "success",
                              "text"           = "{0}{1}"
                            }
                          ]
                        }
                      },
                      {
                        "columnMatch" = "essentials",
                        "formatter"   = 5,
                        "formatOptions" = {
                          "linkTarget"         = "CellDetails",
                          "linkIsContextBlade" = true
                        }
                      }
                    ],
                    "rowLimit" = 1000,
                    "filter"   = true,
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "MonitorCondition"
                      ],
                      "expandTopLevel" = true
                    }
                  }
                },
                "conditionalVisibility" = {
                  "parameterName" = "Severity",
                  "comparison"    = "isNotEqualTo"
                },
                "showPin" = true,
                "name"    = "Alerts for severity"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 11"
              },
              {
                "type" = 3,
                "content" = {
                  "version"              = "KqlItem/1.0",
                  "query"                = "AlertsManagementResources | where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| extend Severity=tostring(properties.essentials.severity)\r\n| where Severity in ({Severity})\r\n| where name contains_cs \"{Custom}\"\r\n| extend State=tostring(properties.essentials.alertState)\r\n| summarize Alerts=count(), New=countif(State==\"New\"), \r\nAcknowledged=countif(State==\"Acknowledged\"), \r\nClosed=countif(State==\"Closed\")\r\nby Resource=tostring(properties.essentials.targetResource )\r\n| order by Alerts desc\r\n",
                  "size"                 = 2,
                  "title"                = "{Severity} Alerts by Region",
                  "noDataMessage"        = "No alerts found",
                  "exportMultipleValues" = true,
                  "exportAggregateParts" = true,
                  "exportedParameters" = [
                    {
                      "parameterName" = "Selected",
                      "parameterType" = 1,
                      "quote"         = ""
                    }
                  ],
                  "queryType"    = 1,
                  "resourceType" = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "map",
                  "gridSettings" = {
                    "rowLimit" = 1000
                  },
                  "mapSettings" = {
                    "locInfo"           = "AzureResource",
                    "locInfoColumn"     = "Resource",
                    "sizeSettings"      = "Alerts",
                    "sizeAggregation"   = "Sum",
                    "minSize"           = 50,
                    "maxSize"           = 100,
                    "defaultSize"       = 0,
                    "legendMetric"      = "Alerts",
                    "legendAggregation" = "Sum",
                    "itemColorSettings" = {
                      "nodeColorField"   = "Alerts",
                      "colorAggregation" = "Sum",
                      "type"             = "heatmap",
                      "heatmapPalette"   = "greenRed"
                    }
                  }
                },
                "customWidth" = "50",
                "conditionalVisibility" = {
                  "parameterName" = "Severity",
                  "comparison"    = "isNotEqualTo"
                },
                "showPin" = true,
                "name"    = "Alerts map"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = "<h3 style=\"text-align=center;color=rgb(0, 128, 96)\">💡 Select one or more regions to see Azure resources with alerts in those regions."
                },
                "conditionalVisibility" = {
                  "parameterName" = "Severity",
                  "comparison"    = "isNotEqualTo"
                },
                "name" = "map selection text"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 9"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "{\"version\"=\"1.0.0\",\"content\"=\"[{Selected}]\",\"transformers\"=null}",
                  "size"          = 1,
                  "title"         = "Resources with {Severity} Alerts in the Selected Regions",
                  "noDataMessage" = "No alerts found",
                  "queryType"     = 8,
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 13,
                        "formatOptions" = {
                          "linkTarget" = "Resource",
                          "showIcon"   = true
                        }
                      },
                      {
                        "columnMatch" = "regionName",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Resource",
                        "formatter"   = 5
                      },
                      {
                        "columnMatch" = "Alerts",
                        "formatter"   = 3,
                        "formatOptions" = {
                          "min"         = 0,
                          "palette"     = "categorical",
                          "aggregation" = "Sum"
                        },
                        "numberFormat" = {
                          "unit" = 17,
                          "options" = {
                            "style"                 = "decimal",
                            "useGrouping"           = false,
                            "maximumFractionDigits" = 2
                          }
                        }
                      },
                      {
                        "columnMatch" = "New",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      },
                      {
                        "columnMatch" = "Acknowledged",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      },
                      {
                        "columnMatch" = "Closed",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "aggregation" = "Sum"
                        }
                      }
                    ],
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "regionName"
                      ],
                      "expandTopLevel" = true,
                      "finalBy"        = "Resource"
                    },
                    "labelSettings" = [
                      {
                        "columnId" = "regionName",
                        "label"    = "Region"
                      },
                      {
                        "columnId" = "Resource"
                      },
                      {
                        "columnId" = "Alerts"
                      },
                      {
                        "columnId" = "New"
                      },
                      {
                        "columnId" = "Acknowledged"
                      },
                      {
                        "columnId" = "Closed"
                      }
                    ]
                  }
                },
                "customWidth" = "50",
                "conditionalVisibility" = {
                  "parameterName" = "Selected",
                  "comparison"    = "isNotEqualTo"
                },
                "name" = "selected map items"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "customWidth" = "25",
                "name"        = "text - 12"
              },
              {
                "type" = 1,
                "content" = {
                  "json" = ""
                },
                "name" = "text - 14"
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where name contains_cs \"{Custom}\"\r\n| extend Type=tostring(properties.essentials.targetResourceType)\r\n| summarize Count=count() by subscriptionId",
                  "size"          = 1,
                  "title"         = "Count per Subscription",
                  "noDataMessage" = "No Alerts Found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "tiles",
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "subscriptionId",
                      "formatter"   = 15,
                      "formatOptions" = {
                        "linkTarget" = null
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    },
                    "showBorder"        = false,
                    "sortCriteriaField" = "Count",
                    "size"              = "auto"
                  }
                },
                "customWidth" = "50",
                "name"        = "query - 11",
                "styleSettings" = {
                  "showBorder" = true
                }
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where name contains_cs \"{Custom}\"\r\n| extend Type=tostring(properties.essentials.targetResourceType)\r\n| summarize Count=count() by Type",
                  "size"          = 1,
                  "title"         = "Count per Type",
                  "noDataMessage" = "No Alerts Found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "visualization" = "tiles",
                  "tileSettings" = {
                    "titleContent" = {
                      "columnMatch" = "Type",
                      "formatter"   = 16,
                      "formatOptions" = {
                        "showIcon" = true
                      }
                    },
                    "leftContent" = {
                      "columnMatch" = "Count",
                      "formatter"   = 12,
                      "formatOptions" = {
                        "palette" = "auto"
                      },
                      "numberFormat" = {
                        "unit" = 17,
                        "options" = {
                          "maximumSignificantDigits" = 3,
                          "maximumFractionDigits"    = 2
                        }
                      }
                    },
                    "showBorder"        = false,
                    "sortCriteriaField" = "Count"
                  }
                },
                "customWidth" = "50",
                "name"        = "query - 11 - Copy",
                "styleSettings" = {
                  "showBorder" = true
                }
              },
              {
                "type" = 3,
                "content" = {
                  "version"       = "KqlItem/1.0",
                  "query"         = "AlertsManagementResources \r\n| where type =~ 'microsoft.alertsmanagement/alerts'\r\n| where properties.essentials.startDateTime {timeRange}  \r\n| where name contains_cs \"{Custom}\"\r\n//| extend Signal = tostring(properties.essentials.signalType) \r\n| extend AlertRule = tostring(properties.essentials.alertRule)\r\n| extend Description = tostring(properties.essentials.description)\r\n| extend TargetResource = tostring(properties.essentials.targetResource) \r\n| extend Severity = tostring(properties.essentials.severity)\r\n//| extend MonitorService = tostring(properties.essentials.monitorService)\r\n| extend MonitorCondition =  tostring(properties.essentials.monitorCondition)\r\n//| extend ActionStatusAlert = tostring(properties.essentials.actionStatus.isSurpressed)\r\n| extend State=tostring(properties.essentials.alertState)\r\n| extend Severity=tostring(properties.essentials.severity)\r\n| extend TimeS= todatetime(properties.essentials.startDateTime)\r\n| extend Sev = toint(substring(Severity,3))\r\n| summarize Count=count() by Severity, subscriptionId,AlertRule, TargetResource, name,Description,  MonitorCondition, TimeS\r\n| project name, Count, Severity,TargetResource, MonitorCondition, AlertRule, Description, subscriptionId, TimeS\r\n| order by Severity asc",
                  "size"          = 2,
                  "title"         = "Name of Alerts with the respective counts (Expand to view full details)",
                  "noDataMessage" = "No Alerts Found",
                  "queryType"     = 1,
                  "resourceType"  = "microsoft.resourcegraph/resources",
                  "crossComponentResources" = [
                    "{Subscription}"
                  ],
                  "gridSettings" = {
                    "formatters" = [
                      {
                        "columnMatch" = "$gen_group",
                        "formatter"   = 0,
                        "formatOptions" = {
                          "customColumnWidthSetting" = "120ch"
                        }
                      },
                      {
                        "columnMatch" = "name",
                        "formatter"   = 5,
                        "formatOptions" = {
                          "customColumnWidthSetting" = "100ch"
                        }
                      },
                      {
                        "columnMatch" = "Count",
                        "formatter"   = 8,
                        "formatOptions" = {
                          "palette" = "categorical"
                        }
                      }
                    ],
                    "rowLimit" = 1000,
                    "hierarchySettings" = {
                      "treeType" = 1,
                      "groupBy" = [
                        "name"
                      ],
                      "expandTopLevel" = true
                    }
                  }
                },
                "name" = "query - 10"
              }
            ]
          },
          "conditionalVisibility" = {
            "parameterName" = "Subscription",
            "comparison"    = "isNotEqualTo"
          },
          "name" = "nestedgroup"
        }
      ]
    },
    "conditionalVisibility" = {
      "parameterName" = "selectedTab",
      "comparison"    = "isEqualTo",
      "value"         = "Custom"
    },
    "name" = "Custom",
    "styleSettings" = {
      "showBorder" = true
    }
  }
]
data_json_version   = "Notebook/1.0"
resource_group_name = "example-resources"
workbook_name       = "wb-alert-analytics"
