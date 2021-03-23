provider "azurerm" {
    #version = "~>1.22"
}

module "hub_network" {
  source  = "./modules/hub_network"
  resource_group_name = "${var.resource_group_name}"
  name_prefix = "${var.name_prefix}"
  vnet_range = "${var.vnet_range}"
  location = "${var.location}"
  subnet_gw_range = "${var.subnet_gw_range}"
  azusubnetfw = "${var.azusubnetfw}"
  subnet_dmz_range = "${var.subnet_dmz_range}"
  tags = "${var.tags}"
  region_name = "${var.region_name}"
  express_route_circuit_id = "${var.er_circuit_id}"

}


module "hub_firewall" {
  source  = "./modules/hub_firewall"
  resource_group_name = "${var.resource_group_name}"
  name_prefix = "${var.name_prefix}"
  vnet_range = "${var.vnet_range}"
  subnet_id  = "${module.hub_network.subnet_id}"
  location = "${var.location}"
  subnet_gw_range = "${var.subnet_gw_range}"
  azusubnetfw = "${var.azusubnetfw}"
  subnet_dmz_range = "${var.subnet_dmz_range}"
  tags = "${var.tags}"
  region_name = "${var.region_name}"
}