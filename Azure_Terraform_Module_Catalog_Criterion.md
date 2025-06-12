# Azure Terraform Module Catalog Criterion

## Table of Contents
- [Overview](#overview)
- [Alignment Objectives](#alignment-objectives)
- [Catalog Criteria](#catalog-criteria)
  - [Alignment with Best Practices](#alignment-with-best-practices)
  - [Smart Defaults](#smart-defaults)
  - [Functionality and Coverage](#functionality-and-coverage)
  - [Consumption Pattern](#consumption-pattern)
  - [Usability](#usability)
  - [Performance/Scalability](#performancescalability)
  - [Cost Efficiency](#cost-efficiency)
  - [Operational Excellence](#operational-excellence)
  - [Maintainability and Support Model](#maintainability-and-support-model)
  - [Integration with Existing Tools](#integration-with-existing-tools)
  - [Cloud Consistency](#cloud-consistency)
- [Azure Terraform Modules Contribution Guide](#azure-terraform-modules-contribution-guide)
  - [Understanding the Cloud Environment](#understanding-the-cloud-environment)
  - [Module Structure](#module-structure)
  - [Smart Non-Destructive Defaults](#smart-non-destructive-defaults)
  - [Enhanced Best Practices](#enhanced-best-practices)
  - [Documentation Requirements](#documentation-requirements)
  - [Additional Guidelines](#additional-guidelines)
  - [Module Development Checklist](#module-development-checklist)

---

## Overview

This document establishes the comprehensive criteria and guidelines for developing, maintaining, and contributing to the Azure Terraform Module Catalog. It ensures consistency, security, governance, and operational excellence across all Terraform modules.

## Alignment Objectives

The following objectives must be aligned upon before implementation:

- **Definition of Done**: Clear completion criteria for module development
- **Usage Patterns**: Standardized approaches for module consumption
- **Initial Set of Customer-Specific Modules**: Priority modules for immediate development
- **Timelines**: Project milestones and delivery schedules

---

## Catalog Criteria

### Alignment with Best Practices

**Description**: Enforces enterprise standards for consistency and governance.

**Key Requirements**:
- **Security**: Encryption, least-privilege access
- **Compliance**: Meets regulatory and internal policies

**Mechanism**: 
- Follow [Terraform Module Development Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- Implement smart defaults with environmental "lookup" mechanisms
- Utilize Terraform resource tagging
- Implement Terraform `validation` blocks
- Use Terraform sub-modules as appropriate

### Smart Defaults

**Implementation Strategy**:
- Environmental "lookup" mechanisms for resource discovery
- Terraform resource tagging for consistent metadata
- Terraform `validation` blocks for input verification
- Terraform sub-modules for modular functionality

### Functionality and Coverage

**Target**: 80% coverage of application patterns

**Core Modules Required**:

| Module Type | Azure Service | Description |
|-------------|---------------|-------------|
| **VM** | Azure Virtual Machines | Linux and Windows instances |
| **DB-VM** | Azure Virtual Machines | Database-specific VMs |
| **DB-Managed** | Azure Database for PostgreSQL/MySQL | Managed database services (Non-Oracle) |
| **K8s** | Azure Kubernetes Service (AKS) | Container orchestration |
| **RBAC** | Azure Role-Based Access Control | Application team provisioning roles |
| **Secrets** | Azure Key Vault | Secrets management |
| **DNS** | Azure DNS | DNS integration |
| **Load Balancing** | Azure Load Balancer | L4 and L7 load balancing |
| **Backup** | Azure Backup/Site Recovery | Backup and disaster recovery |
| **Object Store** | Azure Storage Account | Blob storage |
| **Encryption** | Azure Key Vault | Key management service |
| **Monitoring** | Azure Monitor | Monitoring and logging |

**Planning Requirements**:
- Roadmap coordination with Migration workstream and application teams
- Establish baseline resource requirements
- Implement control-aware code (Azure Policy integration)

### Consumption Pattern

**Options**:
- Pull requests for controlled integration
- Direct reference for immediate consumption

### Usability

**Requirements**:
- **Clear Documentation**: Comprehensive README files
- **Usage Examples**: Real examples in the Lumen environment
- **Minimal Configuration**: Deploy via CI/CD with minimal setup
- **Account Flexibility**: Usable in any workload account
- **Override Options**: Customization capabilities when needed

**Implementation**:
- Smart defaults with environmental lookup mechanisms
- Terraform resource tagging
- Terraform `validation` blocks
- Control-aware code (Azure Policy integration)

### Performance/Scalability

**Objective**: Ensure modules meet performance needs and scale effectively.

**Requirements**:
- Tested for latency and throughput
- Support auto-scaling and load balancing
- Align with enterprise growth projections

**Implementation**: Smart defaults through Terraform variables

### Cost Efficiency

**Objective**: Manage and optimize cloud spending effectively.

**Strategies**:
- **Cost-saving**: Azure Spot VMs, automated shutdowns
- **Monitoring**: Outputs for cost tracking and analysis
- **Prevention**: Limits to prevent cost overruns

**Implementation**:
- Smart defaults that disable highly costly configurations
- Terraform `validation` blocks for cost controls

### Operational Excellence

**Objective**: Integrate with existing operational teams and processes.

**Requirements**:
- **Monitoring**: Integration with enterprise monitoring tools
- **Logging**: Centralized and accessible logging
- **Automation**: Reduce manual operational tasks

**Implementation**:
- Terraform resource tagging for operational metadata
- Terraform sub-modules for operational components

### Maintainability and Support Model

**Objective**: Keep catalog viable with minimal overhead.

**Requirements**:
- Regular updates for CSP changes
- Defined support process and escalation paths
- Prevent orphaned modules through lifecycle management

**Implementation**:
- Git tagging for version control
- Version pinning for stability
- Terraform private registry (Azure DevOps Artifacts)
- CCOE/ProServe staffing plan
- Clear contribution guidelines
- Start from public modules when possible

### Integration with Existing Tools

**Objective**: Seamless integration with enterprise ecosystem.

**Requirements**:
- CI/CD pipeline compatibility
- CMDB integration automation
- Monitoring system integration
- Azure Automation integration

### Cloud Consistency

**Objective**: Provide unified experience across Cloud Service Providers (CSPs).

**Requirements**:
- Consistent inputs and outputs
- Uniform naming conventions
- Balance cloud-specific differences appropriately

**Implementation**: CCOE establishes guidelines for CSP-specific differences and effort estimation

---

## Azure Terraform Modules Contribution Guide

### Understanding the Cloud Environment

#### Terraform Modules "Contract" with Environment/CI/CD Pipeline

**CCOE Responsibilities**:
- Provide CI/CD Pipeline with Lumen Authorized Terraform modules
- Handle Azure credentials and deployment into target accounts
- Establish networking foundation (VNet, subnets, security groups with standard naming/platform tags)

**Module Requirements**:
- Account for guardrails and compliance requirements
- Simple to start but allow customization for advanced use cases
- Minimize local sub-modules; use [tf-modules--azurerm-tf-modules](https://github.com/CenturyLink/tf-modules--azurerm-tf-modules)
- Consider resource risk, sharing, and segregation of duties
- Application pattern modules written as "stacks" with related resources
- May require prerequisite stacks deployed once per account

### Module Structure

Follow the [Terraform Module Development Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure):

```
my-module/
├── main.tf              # Core resource definitions
├── <feature>.tf         # Additional functionality (not just different resources)
├── variables.tf         # Input variables
├── outputs.tf          # Output values
├── versions.tf         # Version requirements
├── README.md           # Documentation
├── examples/           # Usage examples
│   └── simple_usage/
│       └── main.tf
└── test/              # Automated tests
    └── test_module.go
```

#### Required Files

| File | Purpose |
|------|---------|
| `main.tf` | Primary resource definitions, extended by `<feature>.tf` |
| `<feature>.tf` | Additional resource sets that enable specific functionality |
| `variables.tf` | Input variables with comprehensive descriptions |
| `outputs.tf` | Output values for module consumers |
| `versions.tf` | Required provider and Terraform versions |
| `README.md` | Comprehensive documentation |
| `examples/` | Sample configurations and usage patterns |
| `test/` | Automated tests (optional but recommended) |

### Smart Non-Destructive Defaults

#### Hard-Coded Best Practices

To ensure compliance with Lumen security requirements, some Terraform options must be hard-coded (non-overridable):

```hcl
module "aks" {
  # ... other configuration ...
  
  # Hard-coded for security compliance
  private_cluster_enabled = true  # Prevent public endpoints
}
```

#### Opt-Out Resource Creation

```hcl
variable "create_instance" {
  description = "Whether to create an Azure Virtual Machine instance"
  type        = bool
  default     = false
}

variable "ignore_image_changes" {
  description = "Whether to ignore changes to the VM image"
  type        = bool
  default     = true
}
```

#### Secure Defaults

```hcl
variable "ingress_rules" {
  description = "List of ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []  # No ingress allowed by default
}
```

#### Resource Creation Control

```hcl
variable "storage_account_name" {
  description = "Name of the Azure Storage Account (if null, no storage account is created)"
  type        = string
  default     = null
}

resource "azurerm_storage_account" "example" {
  count                = var.storage_account_name != null ? 1 : 0
  name                 = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location            = var.location
  account_tier        = "Standard"
  account_replication_type = "LRS"
}
```

#### Environment Lookups

##### VNet and Subnet Lookups

Instead of requiring foundation components as input variables, make them discoverable:

```hcl
data "azurerm_virtual_network" "selected" {
  name                = "shared-vnet"
  resource_group_name = "networking-rg"
}

data "azurerm_subnet" "selected" {
  name                 = var.subnet_type  # private or public
  virtual_network_name = data.azurerm_virtual_network.selected.name
  resource_group_name  = data.azurerm_virtual_network.selected.resource_group_name
}
```

##### Compute Image Lookups

```hcl
data "azurerm_platform_image" "golden_image" {
  location  = var.location
  publisher = "Canonical"
  offer     = "0001-com-ubuntu-server-focal"
  sku       = "${var.os}-*"  # Rocky, Ubuntu, Windows, etc
  version   = "latest"
}
```

#### Optional Creation of Required Subcomponents

Modules must contain optional creation (using `count`) for all prerequisite resources to enable atomic deployments when existing resources cannot be imported or looked up.

### Enhanced Best Practices

#### 1. Validation and Constraints

```hcl
variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B2s"
  
  validation {
    condition     = can(regex("^Standard_[BDFGLMNH][0-9]", var.vm_size))
    error_message = "Invalid VM size. Must be a valid Azure VM size."
  }
}
```

#### 2. Standardized Tagging

```hcl
variable "tags" {
  description = "Map of tags to apply to all resources"
  type        = map(string)
  default     = {}
}

locals {
  default_tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Project     = var.project_name
    Owner       = var.owner_email
  }
  merged_tags = merge(local.default_tags, var.tags)
}
```

> **Note**: `owner_email` must be included for compliance tracking.

#### 3. Version Control

```hcl
terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
```

#### 4. Resource Naming Convention

```hcl
locals {
  name_prefix = "${var.project}-${var.environment}"
  
  resource_names = {
    vm              = "${local.name_prefix}-vm"
    nsg             = "${local.name_prefix}-nsg"
    storage_account = "${local.name_prefix}sa${random_string.suffix.result}"
  }
}

# For globally unique resources, include random suffix
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
```

#### 4a. Unique Resource Naming

For resources requiring global uniqueness (Storage Accounts, Key Vaults, etc.), include UIDs to prevent collisions:

```hcl
resource "azurerm_storage_account" "example" {
  name                = "${var.project}${var.environment}sa${random_string.suffix.result}"
  # ... other configuration
}
```

#### 5. Error Handling

```hcl
locals {
  is_valid_config = var.resource_group_name != "" && var.location != ""
}

resource "null_resource" "validation" {
  count = local.is_valid_config ? 0 : 1
  
  provisioner "local-exec" {
    command = "echo 'ERROR: Invalid configuration - resource_group_name and location are required' && exit 1"
  }
}
```

### Documentation Requirements

#### README.md Template

```markdown
# Module Name

## Description
[Module purpose and functionality]

## Prerequisites
[Required setup and dependencies]

## Usage
[Basic usage examples]

```hcl
module "example" {
  source = "path/to/module"
  
  # Required variables
  resource_group_name = "my-rg"
  location           = "East US"
  
  # Optional variables
  environment = "dev"
  tags       = {
    Project = "MyProject"
  }
}
```

## Variables
[Input variables description - auto-generated preferred]

## Outputs
[Output values description - auto-generated preferred]

## Examples
[Detailed usage examples for different scenarios]

## Contributing
[Contribution guidelines]
```

### Additional Guidelines

#### Security Baseline

- ✅ Implement encryption at rest
- ✅ Use Azure RBAC roles with least privilege
- ✅ Enable VNet flow logs
- ✅ Implement Network Security Group rules conservatively
- ✅ Enable Azure Activity Log
- ✅ Implement Azure Policy compliance

#### Cost Optimization

- ✅ Use cost allocation tags
- ✅ Implement auto-scaling where appropriate
- ✅ Consider reserved instances for stable workloads
- ✅ Enable lifecycle policies for storage
- ✅ Implement VM scheduling for non-production environments

#### Testing Requirements

- ✅ Unit tests using Checkov/Wiz.io
- ✅ Must be deployable into any standard "workload" account
- ✅ Integration tests
- ✅ Compliance tests
- ✅ Security scanning
- ✅ Cost estimation tests

#### Code Quality

- ✅ Follow Terraform style guide
- ✅ Use consistent naming conventions
- ✅ Implement proper error handling
- ✅ Include meaningful comments
- ✅ Regular security updates

#### Contribution Workflow

1. **Fork** the repository
2. **Create** a feature branch
3. **Implement** changes following guidelines
4. **Add** comprehensive tests
5. **Update** documentation
6. **Submit** pull request
7. **Address** review comments
8. **Merge** after approval
9. **Create** git tag following [Semantic Versioning](https://semver.org/)

### Module Development Checklist

#### Pre-Development
- [ ] **Architecture Diagram** created
- [ ] **Requirements** clearly defined
- [ ] **Dependencies** identified

#### Development
- [ ] **Required files** present (`main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`)
- [ ] **Variables** properly documented with descriptions and validation
- [ ] **Outputs** defined for all consumable values
- [ ] **Smart defaults** implemented
- [ ] **Environment lookups** configured
- [ ] **Resource naming** follows conventions

#### Documentation
- [ ] **README.md** complete with usage examples
- [ ] **Examples** provided for common use cases
- [ ] **Architecture diagrams** included

#### Testing & Quality
- [ ] **Tests** implemented (unit and integration)
- [ ] **Wiz.io/Checkov** security scan passed
- [ ] **Security baseline** requirements met
- [ ] **Cost optimization** considerations applied
- [ ] **Version constraints** properly set

#### Compliance & Governance
- [ ] **Tags** implemented according to standards
- [ ] **Azure Policy** compliance verified
- [ ] **RBAC** permissions properly configured
- [ ] **Encryption** enabled where required

#### Release
- [ ] **Git tag** created following [Semantic Versioning](https://semver.org/)
- [ ] **Documentation** updated in module registry
- [ ] **Team notification** sent for new release

---

## Conclusion

This guide provides a comprehensive framework for creating consistent, secure, and maintainable Terraform modules for Azure. Following these practices ensures high-quality contributions to the Azure infrastructure codebase while maintaining enterprise standards for security, compliance, and operational excellence.

For questions or clarifications, please engage with the CCOE team or refer to the internal Azure Terraform community channels.
