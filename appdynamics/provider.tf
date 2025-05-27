# tflint-ignore: terraform_required_providers
terraform {

  required_providers {
    appdynamics = {
      source  = "harryemartland/appdynamics"
      version = "0.1.0"
    }
    oauth = {
      source  = "SvenHamers/oauth"
      version = "1.6.7"
    }
  }
}

data "oauth_token" "appd_access_token" {
  client_id      = var.appd_client_id
  client_secret  = var.appd_client_secret
  token_endpoint = "${var.appd_controller_url}/controller/api/oauth/access_token"
  scopes         = [""]
}
