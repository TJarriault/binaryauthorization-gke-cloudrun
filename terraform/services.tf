
resource "google_project_service" "project" {
  count   = length(var.services)
  project = var.project
  service = var.services[count.index]
}

