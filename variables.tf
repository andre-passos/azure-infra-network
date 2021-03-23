variable "resource_group_name" {
  description = "Name of the azure resource group"
  default     = ""
}
variable "location" {
  description = "Location of the network"
}

variable "name_prefix" {
  description = "name prefix for resources"
  default     = ""
}

variable "region_name" {
  description = "Region where resources will be installed"
  default     = ""
}

variable "vnet_range" {
  description = "Range of Virtual Network"
  default     = ""
}
variable "subnet_gw_range" {
  description = "Subnet GW Range"
  default     = ""
}
variable "azusubnetfw" {
  description = "Subnet Firewall GW Range"
  default     = ""
}
variable "subnet_dmz_range" {
  description = "Subnet DMZ Range"
  default     = ""
}
variable "cluster_name" {
  description = "Cluster name"
  default     = ""
}
variable "tags" {
  description = "Add custom tags to all resources"
  type        = "map"
  default     = {}
}
variable "subnet_id" {
  description = "ID for firewall subnet"
  default     = ""
}

# Id of ER Circuit 
variable "er_circuit_id" {
  description = "Private IP space to be used in CIDR format"
  default     = ""
}


