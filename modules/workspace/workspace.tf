resource "azurerm_databricks_workspace" "this" {
  name                        = "${local.prefix}-workspace"
  resource_group_name         = var.adb_rg.name
  managed_resource_group_name = "${local.prefix}-adb-managed-rg"
  location                    = var.adb_rg.location
  sku                         = "premium"
  tags                        = local.tags

  custom_parameters {
    virtual_network_id                                   = azurerm_virtual_network.this.id
    private_subnet_name                                  = azurerm_subnet.private.name
    public_subnet_name                                   = azurerm_subnet.public.name
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private.id
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.public.id
    storage_account_name                                 = local.dbfs_storage_account_name
  }

  depends_on = [
    azurerm_subnet_network_security_group_association.public,
    azurerm_subnet_network_security_group_association.private
  ]
}

provider "databricks" {
  host = azurerm_databricks_workspace.this.workspace_url
}

resource "databricks_metastore_assignment" "this" {
  metastore_id = var.metastore_id
  workspace_id = azurerm_databricks_workspace.this.workspace_id
}
