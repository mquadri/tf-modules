# Default Landing Zone Configuration

## Overview

![Landing-zone-diagram](./landing-zone.drawio.png)

## MVP Landing Zone Resources

- Subscription
  - Management Group Association
- Two AD Groups ()
  - Owners
    - Requestor
  - Contributors
- Azure Role Assignment
  - Owner assigned Subscription level
  - Contributor resource group level
- Resource Group
  - rg-domain-environment
  - Log Analytics (Pushed by policy)
  - Network Watcher (Optional)

## Additional Add-Ons

- Azure SQL Database
- Azure Storage Account
- Azure Virtual Machine
- Azure Key Vault

## Resource Groups

Resource groups serve as a management layer for managing the lifecycle of a group of azure resources tied to the lifecycle of the application. A resource group lifecycle is a set of functions, applications, data, or services that can be used to support the following:

- Services
  - Message broker
  - Virtual Desktop/JumpBox
  - Business logic
  - Identity
- Application
  - Web Front End
  - Middleware
  - Database
- Solution
  - Computing simulator
  - Survey Evaluation

Landing zones are deployed with a minimal set of resource groups consisting of the following:  

- LZ Application Resource Group
  - Default Application Landing Zone for initial deployment
  - Empty by default
  - Add-on Deployments available

The default application resource group created in this deployment is only intended to be a starting area for development deployments. Applications that have multiple assets/feature or function/database lifecycles should be seperated into multiple resource groups. All resources in a resource group should share the same lifecycle. That is, your practice should be to deploy, update, and delete resources with the same lifecycle as a group. For example, a single web application's compute resources are typically deployed as a single unit. However, a database shared with other web applications would most likely be managed in a different lifecycle, and should be in its own resource group.

## Network Configuration

By default new landing zones are deployed in an encapsulated state with limited external and no internal connectivity.

## On-Premisis connectivity
If the application requires on-premsise connectivity, the IPAM ip request process must be followed. Landing zones deployed with On-premises connectivity will have the following network configuration

DNS: Lumon Provided BIND DNS Server

## Role Assignments
