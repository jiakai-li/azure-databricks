resource "azurerm_resource_group" "this" {
  name     = "${local.prefix}-rg"
  location = local.location
  tags     = local.tags
}
