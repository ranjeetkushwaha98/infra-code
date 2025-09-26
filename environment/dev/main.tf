module "resource_group" {
    source = "../../modules/azurerm_rg"
    rg-map = var.rg-map
}

module "acr" {
    source = "../../modules/azurerm_acr"
    acr-map = var.acr-map
    depends_on = [module.resource_group] 
}
module "aks_cluster" {
    source = "../../modules/azurerm_aks"
    aks-map = var.aks-map
    depends_on = [module.resource_group, module.acr]
}
module "sql_server" {
    source = "../../modules/azurerm_sql_server"
    sqlserver-map = var.sqlserver-map
    depends_on = [module.resource_group]
}
module "sql_database" {
    source = "../../modules/azurerm_sql_database"
    sqldb-map = var.sqldb-map
    depends_on = [module.sql_server]
}
module "storage_account" {
    source = "../../modules/azurerm_storage"
    storage-map = var.storage-map
    depends_on = [module.resource_group]
}