##################################
##     VPC Network & Subnets    ##
##################################

variable "project_id" {
  description = "The ID of the project in which to create the resources."
  type        = string
}

variable "networking" {
  description = "A list of network configurations."
  type = list(object({
    network_name                           = string
    description                            = string
    auto_create_subnetworks                = bool
    routing_mode                           = string
    delete_default_internet_gateway_routes = bool
    mtu                                    = number
    subnet_name                            = string
    subnet_ip                              = string
    subnet_region                          = string
    private_ip_google_access               = bool
  }))
}

##################################
##     Cloud Run    ##
##################################

variable "cloud_run_services" {
  description = "A list of Cloud Run service configurations."
  type = list(object({
    name            = string
    region          = string
    location        = string
    image           = string
    percent         = number
    latest_revision = bool
  }))
}