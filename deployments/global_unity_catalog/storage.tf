resource "azurerm_databricks_access_connector" "this" {
  name                = "${local.prefix}-adb-access-connector"
  resource_group_name = var.adb_rg.name
  location            = var.adb_rg.location
  identity {
    type = "SystemAssigned"
  }
  tags = local.tags
}

resource "azurerm_storage_account" "unity_catalog" {
  name                     = local.metastore_storage_account_name
  location                 = var.adb_rg.location
  resource_group_name      = var.adb_rg.name
  tags                     = local.tags
  account_tier             = "Standard"
  account_replication_type = var.replication_type
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "unity_catalog" {
  name                  = "${local.prefix}-metastore"
  storage_account_id    = azurerm_storage_account.unity_catalog.id
  container_access_type = "private"
}

locals {
  uc_roles = [
    "Storage Blob Data Contributor",
    "Storage Queue Data Contributor",
    "EventGrid EventSubscription Contributor",
  ]
}

resource "azurerm_role_assignment" "unity_catalog" {
  for_each             = toset(local.uc_roles)
  scope                = azurerm_storage_account.unity_catalog.id
  role_definition_name = each.value
  principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
}
