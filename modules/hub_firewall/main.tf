resource "azurerm_public_ip" "hub" {
  name                = "hubpip"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_firewall" "fwhub" {
  name                = "ProjectX-hub-vnet-firewall"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  ip_configuration {
    name                 = "configuration"
    subnet_id            = "${var.subnet_id}"

    public_ip_address_id = "${azurerm_public_ip.hub.id}"
  }
}

resource "azurerm_firewall_network_rule_collection" "test" {
  name                = "testcollection"
  azure_firewall_name = "${azurerm_firewall.fwhub.name}"
  resource_group_name = "${var.resource_group_name}"
  priority            = 100
  action              = "Allow"

  rule {
    name = "testrule"

    source_addresses = [
      "10.0.0.0/8",
    ]

    destination_ports = [
      "53",
    ]

    destination_addresses = [
      "8.8.8.8",
      "8.8.4.4",
    ]

    protocols = [
      "TCP",
      "UDP",
    ]
  }
}