output "this" {
  value = {
    workspace_name = azurerm_databricks_workspace.this.name
    resource_group = azurerm_databricks_workspace.this.resource_group_name
  }
}