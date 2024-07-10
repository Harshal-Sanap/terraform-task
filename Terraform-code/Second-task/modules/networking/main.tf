##########################
##     VPC Network      ##
##########################
resource "google_compute_network" "network" {
  # Required
  project = var.project_id
  name    = var.network_name

  # Optional
  description                     = var.description
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = var.delete_default_internet_gateway_routes
  mtu                             = var.mtu
}

##########################
##       Subnets        ##
##########################
resource "google_compute_subnetwork" "subnetwork" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_ip
  region                   = var.subnet_region
  network                  = google_compute_network.network.name
  project                  = var.project_id
  secondary_ip_range       = var.secondary_ip_range
  private_ip_google_access = var.private_ip_google_access
}

