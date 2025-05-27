# Infra Workflow
This example folder structure can be used to deploy infra resources to multiple environments using Terragunt workflows.

Note: The workflow uses OpenID connect. For more information: https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure-openid-connect

## Directory Structure

The following is an example structure of a environment layout with nonprod, preprod, and prod accounts.
```
.
├── CODEOWNERS                            # Standard Github CODEOWNERS file
├── README.md                             # Generic documentation
├── .github
│   ├── actions                    
│   │   ├── terraform-prerequisites                        
│   │   │   └── actions.yml               # reusable terraform prerequisite tasks for workflows
│   │   ├── terraform-apply                        
│   │   │   └── actions.yml               # reusable terragrunt apply task for workflows
│   │   ├── terraform-plan                        
│   │   │   └── actions.yml               # reusable terragrunt plan task for workflows
│   │   ├── terraform-destroy                        
│   │   │   └── actions.yml               # reusable terragrunt destroy task for workflows
│   └── workflows                    
│           ├── infra-deploy.yml          # workflow to deploy terraform plan and apply to multiple environments (uses terragrunt-plan-apply.yml as jobs)
│           └── terragrunt-plan-apply.yml # Reusable workflow for terraform plan and apply
├── commonvars.yaml                       # Platform-wide variables
├─── nonprod                              # Environment Folder
│   ├── envvars.yaml                      # Environment-specific variables
│   ├── terragrunt.hcl                    # Environment terragrunt config (provider details, remote state etc.)
│   ├── Application-01                    # Application specific folder
│   │     ├── resource-folder-01          # Folder for specific set of resources
│   │     │   └── terragrunt.hcl          # Module config
│   │     ├── resource-folder-02  
│   │     │   └── terragrunt.hcl          # Module config
│   │     ├── resource-folder-03
│   │     │   └── terragrunt.hcl          # Module config
│   │     └── resource-folder-04
│   │         └── terragrunt.hcl          # Module config
│   └── Application-02                    # Application specific folder
│         ├── resource-folder-01          # Folder for specific set of resources
│         │   └── terragrunt.hcl          # Module config
│         └── resource-folder-02  
│              └── terragrunt.hcl         # Module config
├── preprod                               # Same general layout as nonprod
└── prod                                  # Same general layout as nonprod
```