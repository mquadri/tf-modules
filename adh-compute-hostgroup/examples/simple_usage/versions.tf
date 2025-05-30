terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    # modtm and random are not typically needed for a simple example
    # unless the example itself directly uses resources from these providers.
    # The module itself uses them via the AVM module.
    # For a clean example, only azurerm might be needed.
    # Keeping them if the example's main.tf requires them, otherwise they can be removed.
    # For now, assuming they might be used by the example code if it's complex.
    modtm = {
      source  = "azure/modtm"
      version = "~> 0.3"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.0"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id should be configured by the user running the example,
  # not hardcoded or prompted here directly in a shared versions.tf.
  # It's typically set via environment variables or CLI login.
}
