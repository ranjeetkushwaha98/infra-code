rg-map = {
  rg1 = {
    resource_group_name     = "rg1"
    resource_group_location = "East US"
  }
}

vnet-map = {
  vnet1 = {
    vnet_name               = "vnet1"
    address_space           = ["10.0.0.0/16"]
    resource_group_location = "East US"
    resource_group_name     = "rg1"
    subnets = {
      subnet1 = {
        subnet_name      = "frontend_subnet"
        address_prefixes = ["10.0.0.0/24"]
      }
      subnet2 = {
        subnet_name      = "backend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
    }
  }
}

vm-map = {
  vm1 = {
    vm_name                 = "frontend-vm"
    resource_group_name     = "rg1"
    resource_group_location = "East US"
    admin_username          = "adminuser"
    admin_password          = "Admin@12345678"
    subnet_name             = "frontend_subnet"
    vnet_name               = "vnet1"
    pip_name                = "frontend-pip"
  }
  vm2 = {
    vm_name                 = "backend-vm"
    resource_group_name     = "rg1"
    resource_group_location = "East US"
    admin_username          = "adminuser"
    admin_password          = "Admin@12345678"
    subnet_name             = "backend_subnet"
    vnet_name               = "vnet1"
    pip_name                = "backend-pip"
  }
}

pip-map = {
  pip1 = {
    pip_name            = "frontend-pip"
    resource_group_name = "rg1"
    location            = "East US"
  }

  pip2 = {
    pip_name            = "backend-pip"
    resource_group_name = "rg1"
    location            = "East US"
  }
}
