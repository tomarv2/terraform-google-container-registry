output "google_project" {
  description = "Google project"
  value       = join("", google_container_registry.registry.*.project)
}

output "google_bucket_self_link" {
  description = "Google project bucket self link"
  value       = join("", google_container_registry.registry.*.bucket_self_link)
}
