resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

locals {
  prefix                         = var.prefix
  location                       = var.adb_rg.location
  metastore_storage_account_name = join("", ["globalmetastore", random_string.naming.result])
  tags                           = var.tags
}
