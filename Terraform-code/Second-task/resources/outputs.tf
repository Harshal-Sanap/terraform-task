##################################
##     VPC Network & Subnets    ##
##################################
output "network_name" {
  value       = module.networking
  description = "The ID of the network created"
}

output "subnet_name" {
  value       = module.networking
  description = "The name of the created subnetwork"
}

##########################
##     Cloud-Run      ##
##########################

output "name" {
  value       = module.cloud_run_service
  description = "Name of the cloud run service"
}
