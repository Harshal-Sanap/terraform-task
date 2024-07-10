##########################
##     VPC Network      ##
##########################
variable "project_id" {
  description = "The ID of the project where this VPC will be created"
}

variable "network_name" {
  description = "The name of the network being created"
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = ""
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}

variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}

variable "mtu" {
  type        = number
  description = "The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively."
  default     = 0
}

##########################
##     Subnets      ##
##########################
variable "subnet_name" {
  description = "The name of the subnetwork."
  type        = string
}

variable "subnet_ip" {
  description = "The primary IP range of the subnetwork."
  type        = string
}

variable "subnet_region" {
  description = "The region where the subnetwork will be created."
  type        = string
}


variable "secondary_ip_range" {
  description = "An array of secondary IP ranges for the subnetwork."
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
  default = []
}

variable "private_ip_google_access" {
  description = "Whether to enable private Google access for the subnetwork."
  type        = bool
  default     = false
}
