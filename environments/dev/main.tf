module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs

}
module "virtual_networks" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_networking"
  networks   = var.networks
}

module "public_ip" {
  depends_on = [module.resource_group, module.virtual_networks]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "vms" {
  depends_on = [module.resource_group, module.virtual_networks, module.public_ip, module.key_vault]
  source     = "../../modules/azurerm_compute"
  vms        = var.vms
}
module "sql_server" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurerm_sql_server"
  sql_server = var.sql_server
}

module "sql_db" {
  depends_on = [module.sql_server]
  source     = "../../modules/azurerm_sql_database"
  sql_db     = var.sql_db
}