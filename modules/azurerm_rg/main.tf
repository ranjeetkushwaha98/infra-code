
resource "azurerm_resource_group" "rg" {
  for_each = var.rg-map
  name     = each.value.rg_name
  location = each.value.location
}
