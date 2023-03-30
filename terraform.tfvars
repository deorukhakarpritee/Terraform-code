rg_config = [{
  create_rg = true
  name      = "FE-INFRA"
  location  = "west us3"
 
},

{create_rg = true
name = "PROD-INFRA"
location = "west us3"
},

{create_rg = true
name = "DEV-INFRA"
location = "west us3"
}
]

Vnet-Subnet_config = [
  {
    vnet_name   = "fe-vnet",
    address     = "172.30.0.0/16",
    dns_servers = [{ dns_servers = "192.168.90.101" }]
    Subnets = [{ Subnet_name = "AzureFirewallSubnet", subnetAddress = "172.30.1.0/24" },
      { Subnet_name = "GatewaySubnet", subnetAddress = "172.30.2.0/24" },
      { Subnet_name = "mgmt-subnet", subnetAddress = "172.30.3.0/24" },
    { Subnet_name = "azurebastionsubnet", subnetAddress = "172.30.4.0/24" }]
    Location = "West US 3",
    RgName   = "FE-INFRA"
  },
  {
    vnet_name = "prod-vnet"
    address = "172.31.0.0/16" 
    dns_servers = [{dns_servers = "192.168.90.101"}]
     Subnets = [{ Subnet_name = "prod-lb-subnet", subnetAddress = "172.31.1.0/24" },
      { Subnet_name = "prod-web-subnet", subnetAddress = "172.31.2.0/24" },
      { Subnet_name = "prod-app-subnet", subnetAddress = "172.31.3.0/24" },
    { Subnet_name = "prod-db-subnet", subnetAddress = "172.31.4.0/24" }]
    Location = "West US 3",
    RgName   = "PROD-INFRA"
  },
  {
    vnet_name = "dev-vnet"
    address = "172.32.0.0/16" 
    dns_servers = [{dns_servers = "192.168.90.101"}]
     Subnets = [{ Subnet_name = "dev-lb-subnet", subnetAddress = "172.32.1.0/24" },
      { Subnet_name = "dev-web-subnet", subnetAddress = "172.32.2.0/24" },
      { Subnet_name = "dev-app-subnet", subnetAddress = "172.32.3.0/24" },
    { Subnet_name = "dev-db-subnet", subnetAddress = "172.32.4.0/24" }]
    Location = "West US 3",
    RgName   = "DEV-INFRA"
  }
]

vnet_peering_config = [ {
  index = 1
  peering1 = "EF-PROD"
  peering2 = "PROD-EF"
  rgname1 = "EF-INFRA"
  rgname2 = "PROD-INFRA"
  vnetname1 = "fe-vnet"
  vnetname2 = "prod-vnet"
},
{
  index = 2
  peering1 = "EF-DEV"
  peering2 = "DEV-EF"
  rgname1 = "EF-INFRA"
  rgname2 = "DEV-INFRA"
  vnetname1 = "fe-vnet"
  vnetname2 = "dev-vnet"
}
 ]

