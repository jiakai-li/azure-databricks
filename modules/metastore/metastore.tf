resource "databricks_metastore" "this" {
  name          = "${local.prefix}-metastore"
  region        = var.adb_rg.location
  force_destroy = true
  storage_root = format(
    "abfss://%s@%s.dfs.core.windows.net/",
    azurerm_storage_container.unity_catalog.name,
    azurerm_storage_account.unity_catalog.name
  )
}

resource "databricks_metastore_data_access" "this" {
  metastore_id = databricks_metastore.this.id
  name         = "${local.prefix}-metastore-data-access"
  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.this.id
  }
  is_default    = true
  force_destroy = true
}

// Attach databricks workspace to the metastore
resource "databricks_metastore_assignment" "this" {
  workspace_id = var.adb_workspace.workspace_id
  metastore_id = databricks_metastore.this.id
}
