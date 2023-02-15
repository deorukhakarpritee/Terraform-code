
resource "azurerm_virtual_network" "vnet1" {

  name                = var.vnet_name
  location            = var.vnet_location
  resource_group_name = var.ResourceGroup_Name
  address_space       = [var.Vnet_addressspace]
  dns_servers = [for e in var.dns_servers: e.dns_servers]
}

resource "azurerm_subnet" "subnets" {
  for_each             = { for each in var.Subnet_config : each.Subnet_name => each }
  name                 = each.value.Subnet_name
  resource_group_name  = var.ResourceGroup_Name
  virtual_network_name = var.vnet_name
  address_prefixes     = [each.value.subnetAddress]
  depends_on = [
    azurerm_virtual_network.vnet1
  ]
}
