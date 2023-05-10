

location         = "west us3"
address_space    = ["10.0.0.0/16"]
address_prefixes = ["10.0.0.0/24"]

//These values we can change as per our requirement 

vm_name        = ["DC100", "DC200"]
vm_size        = "Standard_B2s"
admin_username = "admin100"
admin_password = "Passw0rd@12345"
publisher      = "MicrosoftWindowsServer"
offer          = "WindowsServer"
sku            = "2016-Datacenter"
msversion      = "latest"