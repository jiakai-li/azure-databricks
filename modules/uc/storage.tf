resource "azurerm_databricks_access_connector" "this" {
  name                = "${local.prefix}-adb-access-connector"
  resource_group_name = var.adb_rg.name
  location            = var.adb_rg.location
  identity {
    type = "SystemAssigned"
  }
  tags = local.tags
}
