resource "azurerm_resource_group" "this" {
  name     = "${local.prefix}-rg"
  location = var.location
  tags     = local.tags
}

locals {
  prefix = join("-", [var.prefix, var.environment])
  tags = merge({
    environment : var.environment
  }, var.tags)
}
