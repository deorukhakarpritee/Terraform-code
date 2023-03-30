data "azurerm_virtual_network" "vnet1" {
    name = var.vnetname1
    resource_group_name = var.rgname1
  
}

data "azurerm_virtual_network" "vnet2" {
    name = var.vnetname2
    resource_group_name = var.rgname2
  
}

resource "azurerm_virtual_network_peering" "vet-peering1" {
    name = var.peering1
    resource_group_name = var.rgname1
    virtual_network_name = var.vnetname1
    remote_virtual_network_id = data.azurerm_virtual_network.vnet2.*.id[0]
  
}

resource "azurerm_virtual_network_peering" "vnet-peering2" {
    name = var.peering2
    resource_group_name = var.rgname2
    virtual_network_name = var.vnetname2
    remote_virtual_network_id = data.azurerm_virtual_network.vnet1.*.id[0]
  
}
