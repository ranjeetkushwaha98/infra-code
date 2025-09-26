resource "azurerm_storage_account" "storage" {
    for_each = var.storage-map
  name                     = each.value.storage_name
  resource_group_name      = each.value.rg_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = each.value.tags
}

