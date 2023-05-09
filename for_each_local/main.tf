provider "azurerm" {
  features {}
}


locals {
  rgs = {
    rg100 = {myrgname = "dc900" , myrglocation = "east us"}
    rg101 = {myrgname = "dc901" , myrglocation = "west us3"}
  }
}



resource "azurerm_resource_group" "rg1" {
  
for_each = local.rgs
  name = each.value.myrgname
  location = each.value.myrglocation
}