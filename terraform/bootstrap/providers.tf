terraform {
  required_version = ">= 1.9"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = "~> 4.0"
    }

    azuread = {
      source  = "hashicorp/azuread",
      version = "~> 3.0"
    }

    random = {
      source  = "hashicorp/random",
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.bootstrap_subscription_id
}

provider "azurerm" {
  alias = "online"
  features {}
  subscription_id = var.online_subscription_id
}