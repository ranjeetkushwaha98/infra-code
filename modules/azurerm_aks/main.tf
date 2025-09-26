resource "azurerm_kubernetes_cluster" "aks" {
    for_each = var.aks-map
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix         = each.value.aks_name

  dynamic "default_node_pool" {
    for_each = each.value.node_pool
    content {
      name       = default_node_pool.value.name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = each.value.tags
}