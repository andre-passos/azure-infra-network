provider "azurerm" {}

resource "azurerm_resource_group" "hub-vnet-rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}
# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.name_prefix}"
  address_space       = ["${var.vnet_range}"]
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  tags = "${var.tags}"
}

resource "azurerm_subnet" "azusubnetfw" {
  name                 = "AzureFirewallSubnet"
  address_prefix       = "${var.azusubnetfw}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${var.resource_group_name}"
}
resource "azurerm_subnet" "gateway" {
  name                      = "GatewaySubnet"
  address_prefix            = "${var.subnet_gw_range}"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  resource_group_name       = "${var.resource_group_name}"  
}
resource "azurerm_public_ip" "default" {
  location = "${var.location}"
  name = "NGIP-ProjectX-${var.region_name}-${var.name_prefix}"
  resource_group_name = "${var.resource_group_name}"
  allocation_method = "Dynamic"
}
resource "azurerm_virtual_network_gateway" "default" {
  ip_configuration {
    subnet_id = "${azurerm_subnet.gateway.id}"
    public_ip_address_id = "${azurerm_public_ip.default.id}"
  }
  location = "${var.location}"
  name = "VNG-ProjectX-hub-vnet-${var.region_name}"
  resource_group_name = "${var.resource_group_name}"
  sku = "Standard"
  type = "ExpressRoute"

  depends_on = ["azurerm_subnet.gateway", "azurerm_public_ip.default"]
}
resource "azurerm_virtual_network_gateway_connection" "default" {
  location = "${var.location}"
  name = "VNGC-ProjectX-hub-vnet-${var.region_name}"
  resource_group_name = "${var.resource_group_name}"
  type = "ExpressRoute"
  virtual_network_gateway_id = "${azurerm_virtual_network_gateway.default.id}"
  ## express_route_circuit_id, is a url like "/subscriptions/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX/resourceGroups/<NAME OF RG>/providers/Microsoft.Network/expressRouteCircuits/<Express Route Name>"
  express_route_circuit_id = "${var.express_route_circuit_id}"
  authorization_key = "${var.azure_network_gateway_conn_key}"
  connection {
    name = "VNGC-C-ProjectX-hub-vnet-${var.region_name}"
  }

  depends_on = ["azurerm_virtual_network_gateway.default"]
}

output "subnet_id" {
  description = "Subnet ID"
  value       = "${azurerm_subnet.azusubnetfw.id}"
}

output "vnet_name" {
  description = "vnet name"
  value       = "${azurerm_virtual_network.vnet.name}"
}
