resource "azurerm_virtual_network" "virtual_network" {
  for_each            = var.vnet-map
  name                = each.value.vnet_name
  address_space       = each.value.address_space
  location            = each.value.resource_group_location
  resource_group_name = each.value.resource_group_name

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}
