provider "azurerm" {

  features {}

}

module "rg_module" {

  for_each = { for each in var.rg_config : each.name => each }
  source   = "./rg_module"
  name     = each.value.name
  location = each.value.location
}

module "vnet_module" {
  for_each           = { for each in var.Vnet-Subnet_config : each.vnet_name => each }
  source             = "./vnet_module"
  vnet_location      = each.value.Location
  ResourceGroup_Name = each.value.RgName
  vnet_name          = each.value.vnet_name
  Vnet_addressspace  = each.value.address
  dns_servers        = each.value.dns_servers
  Subnet_config      = each.value.Subnets


  depends_on = [
    module.rg_module
  ]
}

module "vnet_peering" {
  for_each = { for each in var.vnet_peering_config : each.index => each }
  source = "./vnet_peering"
  vnetname1 = each.value.vnetname1
  vnetname2 = each.value.vnetname2
  rgname1 = each.value.rgname1
  rgname2 = each.value.rgname2
  peering1 = each.value.peering1
  peering2 = each.value.peering2

  depends_on = [
    module.vnet_module
  ]
}




