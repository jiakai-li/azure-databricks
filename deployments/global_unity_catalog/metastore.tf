data "azurerm_databricks_workspace" "this" {
  name                = var.adb_workspace.workspace_name
  resource_group_name = var.adb_workspace.resource_group
}

resource "databricks_metastore" "this" {
  name          = "${local.prefix}-metastore"
  region        = module.metastore_rg.this.location
  force_destroy = true
  storage_root = format(
    "abfss://%s@%s.dfs.core.windows.net/",
    azurerm_storage_container.unity_catalog.name,
    azurerm_storage_account.unity_catalog.name
  )
}

// Attach databricks workspace to the metastore
resource "databricks_metastore_assignment" "this" {
  workspace_id = data.azurerm_databricks_workspace.this.workspace_id
  metastore_id = databricks_metastore.this.id
}

// Storage credential created in each workspace
resource "databricks_metastore_data_access" "this" {
  metastore_id = databricks_metastore.this.id
  name         = "metastore-root-data-access"
  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.this.id
  }
  is_default    = true
  force_destroy = true
}
