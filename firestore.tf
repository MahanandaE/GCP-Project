resource "google_firestore_database" "default" {
  name     = "myfirestore123"
  location_id = var.region
  type     = "FIRESTORE_NATIVE"
}






