output "this" {
  value = {
    workspace_name = module.adb_workspace.this.workspace_name
    resource_group = module.adb_workspace.this.workspace_url
  }
}