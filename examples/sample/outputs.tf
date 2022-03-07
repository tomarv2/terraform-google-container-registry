output "google_project" {
  description = "Google project"
  value       = module.gcr.google_project
}

output "google_bucket_self_link" {
  description = "Google project bucket self link"
  value       = module.gcr.google_bucket_self_link
}
