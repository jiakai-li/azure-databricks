resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix                    = join("-", [var.prefix, var.environment])
  location                  = var.adb_rg.location
  dbfs_storage_account_name = join("", [var.environment, random_string.naming.result])
  tags = merge({
    environment : var.environment
  }, var.tags)
}