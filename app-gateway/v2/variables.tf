## Naming and Tags ##
variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
}

variable "resourcetype" {
  description = "the resource type being deployed see naming standards for example"
  type        = string
}

variable "appid" {
  description = "The related application for resources. Used for tagging and naming purposes."
  type        = string
}

variable "appname" {
  description = "the app name for the resources.  Used for tagging and naming purposes"
  type        = string
}

variable "env" {
  description = "The environment code the for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costCostCenter" {
  description = "The cost center code for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costVP" {
  description = "The cost vp for resources. Used for tagging purposes."
  type        = string
}

variable "costAppOwnerTech" {
  description = "The app owner responsible for resources. Used for tagging and naming purposes."
  type        = string
}

variable "costAppOwnerManager" {
  description = "The app owner manager responsible for resources. Used for tagging purposes."
  type        = string
}

variable "costBudgetOwner" {
  description = "The budget owner responsible for resources. Used for tagging purposes."
  type        = string
}

variable "additionalcontext" {
  description = "used for naming purposes such as 01 or 02"
  type        = string
}

#appgw vars
variable "resource_group_name" {
  description = "Name of an existing resource group."
  type        = string
}

# tflint-ignore: terraform_typed_variables
variable "rg_vnet" {
  description = "name of resource group for vnet"
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "rg_vnet" {
  condition = var.rg_vnet != null
  summary   = "WARNING: Deprecation Notice, rg_vnet is not loger used, please remove this variable from your configuration"
}

# tflint-ignore: terraform_typed_variables
variable "rg_kv" {
  description = "name of resource group for kv"
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "rg_kv" {
  condition = var.rg_kv != null
  summary   = "WARNING: Deprecation Notice, rg_kv is not loger used, please remove this variable from your configuration"
}

variable "kv_secret_name" {
  type        = string
  description = "secret id of the cert object stored in the key vault.  you need to enable soft delete for keyvault to use this feature.  it is required if data is not set"
}

variable "identity" {
  type = object({
    enable        = bool
    identity-type = string
  })
  description = "(optional) the managed service identity type for the app gtwy.  the only possible value is user assigned and it defaults to is.  set to enable."
}

variable "user-managed-identities" {
  type        = list(string)
  description = "specifies a list of user managed identity names to be assigned to the app gtwy"
}

variable "application-gateway-name" {
  type        = string
  description = "required - the name of the app gateway -- changing this forces recreation"
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "application-gateway-name" {
  condition = var.application-gateway-name != null
  summary   = "WARNING: Deprecation Notice, application-gateway-name is not loger used, please remove this variable from your configuration"
}

variable "subnet_name" {
  type        = string
  description = "required - subnet where app gateway will be deployed"
}

variable "key_vault" {
  type        = string
  description = "name of keyvault to pull certificates and secrets from"
}

variable "identity_rg" {
  type        = string
  description = "name of the resource group that contains the identity"
}

variable "backend-address-pools" {
  type = list(object({
    backend-address-pool-name = string
    fqdns                     = list(string)
    ip-addresses              = list(string)
  }))
  description = <<EOT
  a list that specifies the backend-pools configuration.
  1. backend-address-pool-name = required - the name of the backend address pool.
  2. fqdn = a list of fqdns which should be part of the backend address pool.
  3. ipaddress = a list of ip addresses which should be part of the backend address pool.
  EOT
}

variable "backend-http-settings" {
  type = list(object({
    backend-http-settings-name          = string
    port                                = number
    protocol                            = string
    override-backend-path               = string
    probe-name                          = string
    request-timeout                     = number
    host-name                           = string
    pick-host-name-from-backend-address = bool
    cookie-based-affinity               = string
    affinity-cookie-name                = string
    trusted-root-certificates           = list(string)
    drain-timeout-sec                   = number
    connection-draining-enabled         = bool
    authentication-certificates = list(object({
      enable                          = bool
      authentication-certificate-name = string
    }))
  }))
  description = <<EOT
  A list that specifies the backend-http-settings configuration
  1. backend-http-settings-nmae           = (required) the name of the backend http settings collection.
  2. port                                 = (required) the port which should be used for this backend http settings collection.
  3. protocol                             = (required) the protocol which should be used.  possible values are Http and Https.
  4. override-backend-path                = (optional) the path which should be used as a prefix for all HTTP requests.
  5. probe-name                           = (optional) the name of an associated http probe
  6. request-timeout                      = (required) the request timeout in seconds, which must be between 1 and 86400 seconds.
  7. host-name                            = (optional) host header to be sent to the backend servers.  cannot be set if pick-host-name-from-backend-address is set to true
  8. pick-host-name-from-backend-address  = (optional) whether host header should be picked from the host name of the backend server.  defaults to false.
  9. cookie-based-affinity                = (required) is cookie-based affinity enabled? possible values are enabled and disabled.
  10. affinity-cookie-name                = (optional) the name of the affinity cookie
  11. trusted-root-certificates           = (optional) a list of the trusted-root-certificated names
  12. drain-timeout-sec                   = (required) the number of seconds connection draining is active.  acceptable values are from 1 to 3600 seconds.
  13. connection-draining-enabled         = (required) if connection draining is enabled or not.
  authentication-certificate              = (optional) one or more authentication-certificate blocks.  parameters are defined below.
  14. enable                              = switch to enable authentication-certificate feature.
  15. authentication-certificate-name     = (required) the name of the authentication certificate.
  EOT
}

variable "frontend-ports" {
  type = list(object({
    frontend-port-name = string
    frontend-port      = number
  }))
  description = <<EOT
  a list that specifies the frontend-ports configuration.
  1. frontend-port-name = (required) the name of the frontendport
  2. frontend-port      = (required) the port used for this frontend port
  EOT
}

variable "gateway-ip-configurations" {
  type = list(object({
    gateway-ip-configuration-name = string
    subnet-name                   = string
  }))
  description = <<EOT
  a list that specifies the gateway-ip configuration.
  1. gateway-ip-configuration-name = (required) the name of this Gateway IP configuration.
  2. subnet-name                   = (optional) the name of the subnet which the application gateway should be connected to.  required if var.subnet-names have multiple subnets.
  EOT
}

variable "http-listeners" {
  type = list(object({
    http-listener-name             = string
    frontend-ip-configuration-name = string
    frontend-port-name             = string
    http-listener-protocol         = string
    host-name                      = string
    host-names                     = list(string)
    require-sni                    = bool
    ssl-certificate-name           = string
  }))
  description = <<EOT
  A list that specifies the http-listeners configuration.
  1. http-listener-name              = (required) the name of the http listener
  2. frontend-ip-configuration-name  = (required) the name of the frontend ip configuration used for this http listener
  3. frontend-port-name              = (required) the name of the frontend port used for this http listener
  4. http-listener-protocol          = (required) the protocol to use for this http listener.  acceptable values are Http and Https.
  5. host-name                       = (optional) the hostname which should be used for this http listener.  setting this value changes the listener type to multi site.  the host-names and host-name are mutually exclusive and cannot both be set.
  6. host-names                      = (optional) a list of hostnames should be used for this http listener.  it allows special wildcard characters. the host-names and host-name are mutually exclusive and cannot both be set.
  7. require-sni                     = (optional) should server name indication be required.  defaults to false.
  8. ssl-certificate-name            = (optional) the name of the associated ssl certificate which should be used for this http listener.
  EOT
}

variable "request-routing-rules" {
  type = list(object({
    request-routing-rule-name   = string
    request-routing-rule-type   = string
    http-listener-name          = string
    backend-address-pool-name   = string
    backend-http-settings-name  = string
    redirect-configuration-name = string
    rewrite-rule-set-name       = string
    url-path-map-name           = string
  }))
  description = <<EOT
  a list that specifies the request-routing-rules configuration
  1. request-routing-rule-name     = (required) the name of this request routing rule
  2. request-routing-rule-type     = (required) the type of routing that should be used for this rule.  acceptable values are Basic and PathBasedRouting
  3. http-listener-name            = (required) the name of the http listener which should be used for the routing rule
  4. backend-address-pool-name     = (optional) the name of the backend address pool which should be used for this routing rule.  cannot be set if redirect-configuration-name is set
  5. backend-http-settings-name    = (optional) the name of the backend http settings collection which should be used for this routing rule.  cannot be set if redirect-configuration-name is set
  6. redirect-configuration-name   = (optional) the name of the redirect configuration which should be used for this routing rule. cannot be set if either backend-address-pool-name or backend-http-settings-name is set
  7. rewrite-rule-set-name         = (optional) the name of the rewrite rule set which should be used for the routing rule.  only valid for v2 skus.
  8. url-path-map-name             = (optional) the name of the url path map which should be associated with this routing rule.
  Note: backend-address-pool-name, backend-http-settings-name, redirect-configuration-name, and rewrite-rule-set-name are applicable only when rule-type is basic.
  EOT
}

variable "probes" {
  type = list(object({
    probe-name                                = string
    probe-host                                = string
    probe-interval                            = number
    protocol                                  = string
    probe-path                                = string
    probe-timeout                             = number
    probe-unhealthy-threshold                 = number
    port                                      = number
    minimum-servers                           = number
    match-body                                = string
    match-status-codes                        = list(string)
    pick-host-name-from-backend-http-settings = bool
  }))
  description = <<EOT
  a list that specifies the probes configuration
  1. probe-name                                 = (required) the name of the probe.
  2. probe-host                                 = (optional) the hostname used for this probe. if the app gateway is configured for single site, by default the host name should be specified as 127.0.0.1, cannot be set if pick-host-name-from-backend-http-settings is set to true.
  3. probe-interval                             = (required) the interval between twho consecutive probes in seconds. possible value ranges is from 1 second to a max of 86,400 seconds.
  4. protocol                                   = (required) the protocol used for this probe. acceptable values are Http and Https.
  5. probe-path                                 = (required) the path used for this probe.
  6. probe-timeout                              = (required) the timeout for the probe, which indicates when a probe becomes unhealthy.  acceptable values - 1 second to 86,400 seconds
  7. probe-unhealthy-threshold                  = (required) the unhealthy threshold for this probe which indicates the amount of retries that should be attempted before a node is deemed unhealthy. acceptable values = 1 - 20 seconds.
  8. port                                       = (optional) custom port which will be used for probing the backend servers. the valid value ranges are from 1 to 65535.  in case not set, port from http settings will be used.  this property is valid for Standard_V2 only.
  9. minimum-servers                            = (optional) the minimum number of servers that are always marked as healthy.  defaults to 0
  10. match-body                                = (optional) a snippet from the response body which must be present in the response
  11. match-status-codes                        = (optional) a list of allowed status codes for this health probe
  12. pick-host-name-from-backend-http-settings = (optional) whether the host header should be picked from the backend http settings. defaults to false
  EOT
}

variable "authentication-certificates" {
  type = list(object({
    enable                          = bool
    authentication-certificate-name = string
    authentication-certificate-data = string
  }))
  description = <<EOT
  a list that specifies the authentication-certificates configuration.
  1. enable = switch to enable authentication-certificate feature
  2. authentication-certificate-name = (required) the name of the authentication certificate to use
  3. authentication-certificate-data = (required) the contents of the authentication certficiate to use
  EOT
  default     = []
}

variable "trusted-root-certificates" {
  type = list(object({
    trusted-root-certificate-name             = string
    trusted-root-certificate-data             = string
    trusted-root-certificate-data-secret-name = string
  }))
  description = <<EOT
  a list that specifies the trusted-root-certificates configuration
  1. trusted-root-certificate-name = (required) the name of the trusted root certificate to use
  2. trusted-root-certificate-data = (required) the contents of the trusted root certificate
  EOT
  default     = []
}

variable "ssl-policy" {
  type = object({
    disabled-protocols   = list(string)
    policy-type          = string
    policy-name          = string
    cipher-suites        = list(string)
    min-protocol-version = string
  })
  description = <<EOT
  a list that specifies the ssl-policy configuration
  1. disabled protocols   = (optional) the list of ssl protocols which should be disabled on this app gateway.  possible values are: TLSv1_0, TLSv1_1 and TLSv1_2.  Note: disabled-protocols cannot be set when policy-name or policy-type are set.
  2. policy-type          = (optional) the type of the policy.  possible values are Predefined and Custom.  Note: policy-type is Required when Policy-name is set.  cannot be set if disabled_protocols is set.
  3. policy-name          = the name of the policy e.g AppGwSslPolicy20170401S.  required if policy-type is set to Predefined.  possible values are published here: https://docs.microsoft.com/en-us/azure-application-gateway/application-gateway-ssl-policy-overview.  not compatible with disabled-protocols.
  4. cipher-suites        = a list of accepted cipher suites.  possible values = https://www.terraform.io/docs/providers/azurerm/r/application_gateway.html#cipher_suites
  5. min-protocol-version = the minimal tls version.  possible values are: TLSv1_0, TLSv1_1, TLSv1_2
  EOT
}

variable "enable-http2" {
  type        = bool
  description = "(optional) Is HTTP2 enabled on the app gateway resource? defaults to true"
  default     = true
}

variable "ssl-certificates" {
  type = list(object({
    ssl-certificate-name                 = string
    ssl-certificate-data                 = string
    ssl-certificate-password             = string
    ssl-certificate-data-secret-name     = string
    ssl-certificate-password-secret-name = string
    key-vault-secret-id                  = string
  }))
  description = <<EOT
  a list that specifies the ssl-certificates configuration.
  1. ssl-certificate-name                 = (required) the name of the ssl certificate that is unique within this app gateway
  2. ssl-certificate-data                 = (optional) pfx certificate. required if key-vault-secret-id or ssl-certificate-data-secret is not set.
  3. ssl-certificate-password             = (optional) password for the pfx file specified in data.  required if ssl-certificate-data is set
  4. ssl-certificate-data-secret-name     = (optional) the name of the key vault secret that holds the ssl certificate data in the form of base-64 encoded encrypted PFX format data. not required if ssl-certificate-data is set.
  5. ssl-certificate-password-secret-name = (optional) the name of the key vualt secret that holds the ssl certificate password.  not required if ssl-certificate-password is set.
  6. key-vault-secret-id                  = (optional) the name of the secret ID of (base-64 encoded unencrypted PFX) secret or certificate object stored in an Azure Keyvault. you will need to enable soft delete for keyvault to use this feature.  required if data is not set.
  Note: TLS termination with key vault certificates is limited to v2 Skus.
  Note: For TLS termination with key vault certificates to work properly existing user-assigned managed identity, which application gateway uses to retrieve certificates from key vault, should be defined by the identity block, additionally, access policies in the key vault will be needed to allow the identity to access the secret.
  EOT
}

variable "redirect-configurations" {
  type = list(object({
    enable                      = bool
    redirect-configuration-name = string
    redirect-type               = string
    target-listener-name        = string
    target-url                  = string
    include-path                = bool
    include-query-string        = bool
  }))
  description = <<EOT
  a list that specifies the redirect-configuration
  1. enable                      = switch to enable redirect configuration feature
  2. redirect-configuration-name = (required) unique name of the redirect configuration block
  3. redirect-type               = (required) the type of redirect. acceptable values are Permanent, Temporary, Found, and SeeOther
  4. target-listener-name        = (optional) the name of the listener to redirect to.  cannot be set if target-url is set
  5. target-url                  = (optional) the url to redirect the request to  Cannot be set if target-listener-name is set
  6. include-path                = (optional) whether or not to include the path in the redirected url. defaults to false.
  7. include-query-string        = (optional) whether or not to include the query string in the redirected URL.  default to false.
  EOT
  default     = []
}

variable "autoscale-configuration" {
  type = object({
    enable                 = bool
    autoscale-min-capacity = number
    autoscale-max-capacity = number
  })
  description = <<EOT
  1. enable                 = switch to enable redirect configuration feature
  2. autoscale-min-capacity = (required) minumum capacity for autoscaling.  acceptable values are in the range from 0 to 100.
  3. autoscale-max-capacity = (optional) maximum capacity for autoscaling. acceptable values are in the range from 2 to 125.
  EOT
}

variable "rewrite-rule-set" {
  type = list(object({
    enable                = bool
    rewrite-rule-set-name = string
    rewrite-rules = list(object({
      rewrite-rule-name = string
      rule-sequence     = number
      conditions = list(object({
        variable    = string
        pattern     = string
        ignore-case = bool
        negate      = bool
      }))
      request-header-configurations = list(object({
        header-name  = string
        header-value = string
      }))
      response-header-configuration = list(object({
        header-name  = string
        header-value = string
      }))
    }))
  }))
  description = <<EOT
  a list that specifies the rewrite-rule-set configuration
  1. enable                = switch to enable rewrite rule set block
  2. rewrite-rule-set-name = (required) unique name of the rewrite rule set block
  rewrite-rules = one or more rewrite-rule blocks. parameters defined below.
  3. rewrite-rule-name     = (required) unique name of the rewrite rule block
  4. rule-sequence         = (required) rule sequence of the rewrite rule that determines the order of execution in a set.
  conditions = one or more conditions block.  
  5. variable              = (required) the variable of the conditions.
  6. pattern               = (required) the pattern, either fixed string or regular expression. that evaluates the trusthfulness of the condition
  7. ignore-case           = (optional) perform a case in-sensitive comparision defaults to false.
  8. negate                = (optional) negate the result of the condition evaluation defaults to false.
  request-header-configurations = one or more request-header-configuration blocks. 
  9. header-name           = (required) header name of the header configuration
  10. header-value         = (required) header value of the header configuration
  response-header-configuration = one or more response-header configuration blocks.
  11. header-name          = (required) header name of the header configuration
  12. header-value         = (required) header value of the header configuration
  EOT
  default     = []
}

variable "sku" {
  description = "Sku of the Application Gateway. Check Microsoft documentation for possible values,their combinations and limitations."
  default = {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }
  type = object({
    name     = string
    tier     = string
    capacity = number
  })
}

variable "subnet_id" {
  description = "An ID of a subnet that will host the Application Gateway. Keep in mind that this subnet can contain only AppGWs and only of the same type."
  type        = string
}


# tflint-ignore: terraform_required_providers
resource "validation_warning" "subnet_id" {
  condition = var.subnet_id != null
  summary   = "WARNING: Deprecation Notice, subnet_id is not loger used, please remove this variable from your configuration"
}

variable "priority" {
  description = "rule priority"
  type        = string
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "priority" {
  condition = var.priority != null
  summary   = "WARNING: Deprecation Notice, priority is not loger used, please remove this variable from your configuration"
}

# tflint-ignore: terraform_typed_variables
variable "law_id" {
  description = "log analytics workspace id"
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "law_id" {
  condition = var.law_id != null
  summary   = "WARNING: Deprecation Notice, law_id is not loger used, please remove this variable from your configuration"
}

variable "enable_zones" {
  description = "If false, the input `avzone` is ignored and also all created Public IP addresses default to not to use Availability Zones (the `No-Zone` setting). It is intended for the regions that do not yet support Availability Zones."
  default     = true
  type        = bool
}

variable "avzone" {
  description = "The availability zone to use"
  default     = "1"
  type        = string
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "avzone" {
  condition = var.avzone != null
  summary   = "WARNING: Deprecation Notice, avzone is not loger used, please remove this variable from your configuration"
}

variable "avzones" {
  description = "for zone-redundant with 3 availability zone"
  default     = ["1", "2", "3"]
  type        = list(string)
}

# tflint-ignore: terraform_typed_variables
variable "virtual_network_name" {
  description = "virtual network to deploy gw to"
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "virtual_network_name" {
  condition = var.virtual_network_name != null
  summary   = "WARNING: Deprecation Notice, virtual_network_name is not loger used, please remove this variable from your configuration"
}

# tflint-ignore: terraform_typed_variables
variable "storage_account_id" {
  description = "storage account to send logs to"
}

# tflint-ignore: terraform_required_providers
resource "validation_warning" "storage_account_id" {
  condition = var.storage_account_id != null
  summary   = "WARNING: Deprecation Notice, storage_account_id is not loger used, please remove this variable from your configuration"
}