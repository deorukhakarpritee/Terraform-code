rg_config = [{
  create_rg = true
  name      = "FE-INFRA"
  location  = "west us3"
 
}]

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
  }
]
