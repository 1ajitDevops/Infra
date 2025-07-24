variable "virtual_network_name" {
    type = string
    description = "virtual network ka name"
  
}

variable "virtual_network_location" {
    type = string
    description = "virtual network ka location"
  
}

variable "resource_group_name" {
    type = string
    description = "resource group ka name"
  
}

variable "address_space" {
    type = list(string)
    description = "address space"
  
}