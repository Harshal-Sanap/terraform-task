output "id" {
  value       = google_cloud_run_service.simple-app.id
  description = "ID of the created service."
}
output "name" {
  value       = google_cloud_run_service.simple-app.name
  description = "Name of the service."
}

output "url" {
  value       = google_cloud_run_service.simple-app.status[0].url
  description = "Endpoint of the cloud-run service."
}

output "location" {
  value       = google_cloud_run_service.simple-app.location
  description = "Location of the service."
}
