resource "google_container_registry" "registry" {
  count = var.deploy_registry ? 1 : 0

  location = var.gcr_location
}

/*
resource "google_storage_bucket_iam_member" "viewer" {
  count = var.add_registry_members ? 1 : 0

  bucket = google_container_registry.registry.id
  role = "roles/storage.objectViewer"
  member = "user:jane@example.com"
}
*/
