resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

module "metastore_rg" {
  source      = "../../modules/rg"
  environment = "global"
  location    = var.location
  prefix      = var.prefix
}

locals {
  prefix                         = var.prefix
  location                       = var.location
  metastore_storage_account_name = join("", ["globalmetastore", random_string.naming.result])
  tags                           = var.tags
}
