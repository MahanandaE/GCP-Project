resource "google_cloud_run_service" "example" {
  name     = "example-service"
  location = var.region

  template {
    spec {
      containers {
        image = "nginx"
        resources {
          limits = {
            memory = "512Mi"
            cpu    = "1"
          }
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}