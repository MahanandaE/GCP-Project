provider "google" {
  project = "deep1234"
  region  = "us-central1"
  credentials = file("../test.json")
}


