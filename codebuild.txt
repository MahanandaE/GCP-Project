resource "google_secret_manager_secret" "github_token" {
  secret_id = var.github_secret_name
  replication {
    auto {}
  }

}

resource "google_secret_manager_secret_version" "github_token" {
  secret      = google_secret_manager_secret.github_token.id
  secret_data = file(var.github_token_file)
}

data "google_project" "project" {}

resource "google_secret_manager_secret_iam_member" "cloudbuild" {
  secret_id = google_secret_manager_secret.github_token.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:docker-service-account@deep1234.iam.gserviceaccount.com"
}


resource "google_cloudbuild_trigger" "example" {
  name = "example-trigger"
  location = "global"

  github {
    owner = var.github_owner
    name  = var.github_repo
    push {
      branch = "*"
    }
  }

  build {
    step {
      name = "gcr.io/cloud-builders/docker"
      args = ["build", "-t", "gcr.io/${var.project_id}/example-image", "."]
    }
    images = ["gcr.io/${var.project_id}/example-image"]
  }
}



