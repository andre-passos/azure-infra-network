# VNet CIDR
variable "subnet_range" {
  description = "Private IP space to be used in CIDR format"
  default     = ""
}

# Id of ER Circuit 
variable "express_route_circuit_id" {
  description = "Private IP space to be used in CIDR format"
  default     = ""
}

# Location (region)
variable "location" {
  description = "Azure Region"
  }

# Resource Group Name
variable "resource_group_name" {
  description = "Name of the azure resource group"
  default     = ""
}

# Add special tags to the resources created by this module
variable "tags" {
  description = "Add custom tags to all resources"
  type        = "map"
  default     = {}
}
variable "vnet_range" {
  description = "IP Range of the VNET"
  default = ""
}

variable "region_name" {
  description = "Azure Region name used to naming resources"
  default = ""
}
variable "subnet_gw_range" {
  description = "Subnet Getway Range"
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

variable "name_prefix" {
  description = "name prefix for resources"
  default     = ""
}
variable "subnet_id" {
  description = "ID for firewall subnet"
  default     = ""
}
