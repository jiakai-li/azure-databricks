terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
    databricks = {
      source  = "databricks/databricks"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

provider "random" {
}

module "adb_workspace" {
  source      = "../../modules/workspace"
  environment = var.environment
}

module "uc_storage" {
  source = "../../modules/uc"
  resource_group_id = module.adb_workspace
}
