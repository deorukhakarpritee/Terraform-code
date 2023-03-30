variable "rg_config" {

  type = list(object({
    create_rg = bool
    name      = string
    location  = string
  }))

}

variable "Vnet-Subnet_config" {
  type = list(object({
    vnet_name   = string
    address     = string
    Subnets     = list(object({ Subnet_name = string, subnetAddress = string }))
    Location    = string
    RgName      = string
    dns_servers = list(object({ dns_servers = string }))

  }))
}

variable "vnet_peering_config" {
  type = list(object({
    index = number
    vnetname1 = string
    vnetname2 = string
    rgname1 = string
    rgname2 = string
    peering1 = string
    peering2 = string
    
  }))
  
}

