resource "google_cloud_run_service" "simple-app" {
  project  = var.project_id
  name     = var.name
  location = var.location

  template {
    spec {
      containers {
        image = var.image
      }
    }
  }

  traffic {
    percent         = var.percent
    latest_revision = var.latest_revision
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.simple-app.location
  project     = google_cloud_run_service.simple-app.project
  service     = google_cloud_run_service.simple-app.name
  policy_data = data.google_iam_policy.noauth.policy_data
}

data "google_iam_policy" "noauth" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers"]
  }
}