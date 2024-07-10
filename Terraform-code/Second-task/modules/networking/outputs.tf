##########################
##     VPC Network      ##
##########################
output "network_name" {
  value       = google_compute_network.network.name
  description = "The name of the VPC being created"
}

output "network_id" {
  value       = google_compute_network.network.id
  description = "The ID of the VPC being created"
}

output "network_self_link" {
  value       = google_compute_network.network.self_link
  description = "The URI of the VPC being created"
}

##########################
##         Subnet      ##
##########################

output "subnet_name" {
  description = "The name of the created subnetwork."
  value       = google_compute_subnetwork.subnetwork.name
}

output "subnet_cidr" {
  description = "The IP CIDR range of the created subnetwork."
  value       = google_compute_subnetwork.subnetwork.ip_cidr_range
}

output "subnet_self_link" {
  description = "The self-link URL of the created subnetwork."
  value       = google_compute_subnetwork.subnetwork.self_link
}
