resource "azurerm_mssql_server" "sql_server" {
    for_each = var.sqlserver-map
  name                         = each.value.sqlserver_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.admin_login
  administrator_login_password = each.value.admin_password
  minimum_tls_version          = "1.2"


  tags = each.value.tags
}