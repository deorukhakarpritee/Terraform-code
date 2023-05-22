provider "azurerm" {
  features {}
}


locals {
  rgs = {
    a = {myrgname = "dc900" , myrglocation = "east us"}
    b = {myrgname = "dc901" , myrglocation = "west us3"}
  }
}



resource "azurerm_resource_group" "rg1" {
  
for_each = local.rgs
  name = each.value.myrgname
  location = each.value.myrglocation
}


/*output "azure_resource_group_name" {
    value = [for azurerm_resource_group in azurerm_resource_group.rg1 : azurerm_resource_group["name"]]
}*/

