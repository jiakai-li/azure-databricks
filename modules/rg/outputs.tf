output "this" {
  value = {
    location = azurerm_resource_group.this.location
    id       = azurerm_resource_group.this.id
    name     = azurerm_resource_group.this.name
  }
}