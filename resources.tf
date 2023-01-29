provider "azurerm" {

    features {}
  
}

module "rg_module" {

    count = var.rg_config.create_rg ? 1 : 0
    source = "./rg_module"
    name = var.rg_config.name
    location = var.rg_config.location
  
}