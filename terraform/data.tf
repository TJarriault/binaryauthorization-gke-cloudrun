
# Retrieve Google prject information
data "google_project" "project" {
  project_id = var.project
}

# Expose an access token for communicating with the GKE cluster.
data "google_client_config" "client" {}

locals {
  PROJECT_NUMBER = data.google_project.project.number

}
