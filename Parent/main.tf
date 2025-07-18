module "resource_group" {
    source = "../Child/azurerm_resource_group"
    resource_group_name = "RG-18"
    resource_group_location = "centralindia"
  
}
  
module "virtual_network" {
    source = "../Child/azurerm_virtual_network"
    depends_on = [ module.resource_group ]
    virtual_network_name = "tullu-vnet"
    virtual_network_location = "centralindia"
    resource_group_name = "Rg-18"
    address_space = ["10.0.0.0/18"]

}

module "frontend_subnet" {
    source = "../Child/azurerm_subnet"
    depends_on = [ module.virtual_network ]
    subnet_name = "frontend-subnet"
    resource_group_name = "RG-18"
    virtual_network_name = "tullu-vnet"

    address_prefixes = ["10.0.0.0/24"]
  
}

module "backend_subnet" {
    source = "../Child/azurerm_subnet"
    depends_on = [ module.virtual_network ]
    subnet_name = "backend-subnet"
    resource_group_name = "RG-18"
    virtual_network_name = "tullu-vnet"
    address_prefixes = ["10.0.2.0/24"]
  
}

module "frontend_virtual_machine" {
    source = "../Child/azurerm_virtual_machine"
    depends_on = [ module.frontend_subnet ]
    nic_name = "tullu-nic"
    nic_location = "centralindia"
    resource_group_name = "RG-18"
    ip_configuration_name = "internal"
    subnet_id = module.frontend_subnet.subnet_id
    private_ip_address_allocation = "Dynamic"
    virtual_machine_name = "frontend-vm"
    virtual_machine_location = "centralindia"
    vm_size = "Standard_B1s"
    admin_username = "adminuser"
    admin_password = "Cloud@2026cloud"
    
    vm_publisher = "Canonical"
    vm_offer = "0001-com-ubuntu-server-jammy"
    vm_sku = "22_04-lts"
    vm_version = "latest"
}

# module "backend_virtual_machine" {
#     source = "../Child/azurerm_virtual_machine"
#     depends_on = [ module.backend_subnet ]
#     nic_name = "tullu-nic"
#     nic_location = "centralindia"
#     resource_group_name = "RG-18"
#     ip_configuration_name = "internal"
#     subnet_id = module.backend_subnet.subnet_id
#     private_ip_address_allocation = "Dynamic"
#     virtual_machine_name = "backend-vm"
#     virtual_machine_location = "centralindia"
#     vm_size = "Standard_B1s"
#     admin_username = "adminuser"
#     admin_password = "Cloud@2026cloud"
#     vm_publisher = "Canonical"
#     vm_offer = "0001-com-ubuntu-server-focal"
#     vm_sku = "20_04-lts"
#     vm_version = "latest"
# }

module "pip" {
    source = "../Child/azurerm_public_IP"
    resource_group_name = "RG-18"
    public_ip_location ="centralindia"
    public_ip_name ="tullu-pip"
    allocation_method = "Static"
  
}






  
