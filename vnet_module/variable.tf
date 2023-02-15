variable "vnet_name" {
  type = string
}
variable "vnet_location" {
  type = string
}
variable "Vnet_addressspace" {
  type = string #list (any)
}

variable "ResourceGroup_Name" {
  type = string

}


variable "Subnet_config" {
  type = list(object({
    Subnet_name   = string
    subnetAddress = string
    

  }))
}

variable "dns_servers" {type = list(object({ dns_servers = string}))}