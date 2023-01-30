provider "azurerm" {

    features {}
  
}

module "rg_module" {

    
    for_each = {for each in var.rg_config : each.name => each }
    source = "./rg_module"
    name = each.value.name
    location = each.value.location
  
}