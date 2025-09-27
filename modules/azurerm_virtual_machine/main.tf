data "azurerm_subnet" "subnet_data" {
  for_each             = var.vm-map
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip_data" {
  for_each            = var.vm-map
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

# data "azurerm_network_security_group" "nsg_data" {
#   for_each            = var.vm-map
#   name                = azurerm.network_security_group.nsg[each.key]
#   resource_group_name = each.valu.resource_group_name
# }

# data "azurerm_network_interface" "nic_data" {
#   for_each            = var.vm-map
#   name                = azurerm_network_interface.nic[each.key]
#   resource_group_name = each.valu.resource_group_name
# }

resource "azurerm_network_interface" "nic" {
  for_each            = var.vm-map
  name                = "${each.value.vm_name}-nic"
  location            = each.value.resource_group_location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip_data[each.key].id
  }
}

resource "azurerm_network_security_group" "nsg" {
  for_each            = var.vm-map
  name                = "${each.value.vm_name}-nsg"
  location            = each.value.resource_group_location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsgnic_association" {
  for_each                  = var.vm-map
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vm-map
  name                            = each.value.vm_name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.resource_group_location
  size                            = "Standard_F2"
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
