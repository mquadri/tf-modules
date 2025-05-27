variable "appd_controller_url" {
  description = "AppDynamics controller URL"
  type        = string
}

variable "appd_client_id" {
  description = "AppDynamics OAuth2 Client ID"
  type        = string
}

variable "appd_client_secret" {
  description = "AppDynamics OAuth2 Client Secret"
  type        = string
  sensitive   = true
}

variable "application_id" {
  description = "AppDynamics application id"
  type        = number
}

variable "tiers" {
  description = "Tiers to monitor in the application"
  type        = list(string)
}

variable "alert_email_to" {
  description = "Email address that will get alerts for the application"
  type        = list(string)
  default     = []
}

variable "alert_bigpanda_template" {
  description = "HTTP Template to use to connect to BigPanda"
  type        = string
  default     = ""
}

variable "slow_transactions_warn" {
  description = "A warning event will be triggered for transactions slower than this value (in millisecons)"
  type        = number
  default     = 2000
}

variable "slow_transactions_critical" {
  description = "A critical event will be triggered for transactions slower than this value (in millisecons)"
  type        = number
  default     = 3000
}