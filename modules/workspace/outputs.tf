output "this" {
  value = {
    workspace_name = azurerm_databricks_workspace.this.name
    workspace_url = azurerm_databricks_workspace.this.workspace_url
  }
}