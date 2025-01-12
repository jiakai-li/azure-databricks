terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    databricks = {
      source = "databricks/databricks"
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

module "adb_rg" {
  source      = "../../modules/rg"
  environment = var.environment
  prefix      = var.prefix
  location    = var.location
}

module "adb_workspace" {
  source       = "../../modules/workspace"
  environment  = var.environment
  prefix       = var.prefix
  adb_rg       = module.adb_rg.this
  metastore_id = var.metastore_id
}
