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




