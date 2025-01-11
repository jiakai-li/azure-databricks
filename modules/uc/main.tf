locals {
  prefix   = join("-", [var.prefix, var.environment])
  location = var.adb_rg.location
  tags = merge({
    environment : var.environment
  }, var.tags)
}
