##################################
##     VPC Network & Subnets    ##
##################################
module "networking" {
  source = "../modules/networking"

  project_id = var.project_id
  for_each   = { for network in var.networking : "${network.network_name}" => network }

  network_name                           = each.value.network_name
  description                            = each.value.description
  auto_create_subnetworks                = each.value.auto_create_subnetworks
  routing_mode                           = each.value.routing_mode
  delete_default_internet_gateway_routes = each.value.delete_default_internet_gateway_routes
  mtu                                    = each.value.mtu
  subnet_name                            = each.value.subnet_name
  subnet_ip                              = each.value.subnet_ip
  subnet_region                          = each.value.subnet_region
  private_ip_google_access               = each.value.private_ip_google_access
}

##########################
##     Cloud-Run      ##
##########################
module "cloud_run_service" {
  source     = "../modules/cloud-run"
  project_id = var.project_id
  for_each   = { for service in var.cloud_run_services : "${service.name}" => service }

  name            = each.value.name
  region          = each.value.region
  location        = each.value.location
  image           = each.value.image
  percent         = each.value.percent
  latest_revision = each.value.latest_revision

}