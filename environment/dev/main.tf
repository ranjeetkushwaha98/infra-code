module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg-map = var.rg-map
}

module "virtual_network" {
  source     = "../../modules/azurerm_virtual_network"
  vnet-map   = var.vnet-map
  depends_on = [module.resource_group]
}

module "virtual_machine" {
  source     = "../../modules/azurerm_virtual_machine"
  vm-map     = var.vm-map
  depends_on = [module.virtual_network, module.public_ip]
}

module "public_ip" {
  source = "../../modules/azurerm_public_ip"
  pip-map = var.pip-map
  depends_on = [ module.resource_group ]
}