resource "azurerm_virtual_network" "this" {
  name                = "${local.prefix}-vnet"
  location            = var.adb_rg.location
  resource_group_name = var.adb_rg.name
  address_space       = [var.vnet_cidr]
  tags                = local.tags
}

resource "azurerm_network_security_group" "this" {
  name                = "${local.prefix}-nsg"
  location            = var.adb_rg.location
  resource_group_name = var.adb_rg.name
  tags                = local.tags
}

resource "azurerm_subnet" "public" {
  name                 = "${local.prefix}-public-subnet"
  resource_group_name  = var.adb_rg.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [cidrsubnet(var.vnet_cidr, 4, 0)]

  delegation {
    name = "databricks"
    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_subnet" "private" {
  name                 = "${local.prefix}-private-subnet"
  resource_group_name  = var.adb_rg.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [cidrsubnet(var.vnet_cidr, 4, 1)]

  delegation {
    name = "databricks"
    service_delegation {
      name = "Microsoft.Databricks/workspaces"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
        "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
        "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"
      ]
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.this.id
}
