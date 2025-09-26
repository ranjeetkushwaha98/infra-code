
resource "azurerm_mssql_database" "sql_db" {
    for_each = var.sqldb-map
  name         = each.value.sqldb_name
  server_id    = data.azurerm_mssql_server.sql_data[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = each.value.tags
}
data "azurerm_mssql_server" "sql_data" {
  for_each = var.sqldb-map
  name                = each.value.sqlserver_name
  resource_group_name = each.value.rg_name
}