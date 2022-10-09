output "name" {
  # This may seem redundant with the `name` input, but it serves an important
  # purpose. Terraform won't establish a dependency graph without this to interpolate on.
  description = "The name of the cluster master. This output is used for interpolation with node pools, other modules."

  #value = google_container_cluster.cluster.name
  value = var.cluster_create ? google_container_cluster.cluster.name : null
}

output "master_version" {
  description = "The Kubernetes master version."
  #value       = google_container_cluster.cluster.master_version
  value = var.cluster_create ? google_container_cluster.cluster.master_version : null
}

output "endpoint" {
  description = "The IP address of the cluster master."
  sensitive   = true
  #value       = google_container_cluster.cluster.endpoint
  value = var.cluster_create ? google_container_cluster.cluster.endpoint : null
}

# The following outputs allow authentication and connectivity to the GKE Cluster.
output "client_certificate" {
  description = "Public certificate used by clients to authenticate to the cluster endpoint."
  #value       = base64decode(google_container_cluster.cluster.master_auth[0].client_certificate)
  value = var.cluster_create ? base64decode(google_container_cluster.cluster.master_auth[0].client_certificate) : null
}

output "client_key" {
  description = "Private key used by clients to authenticate to the cluster endpoint."
  #value       = base64decode(google_container_cluster.cluster.master_auth[0].client_key)
  value = var.cluster_create ? base64decode(google_container_cluster.cluster.master_auth[0].client_key) : null
}

output "cluster_ca_certificate" {
  description = "The public certificate that is the root of trust for the cluster."
  #value       = base64decode(google_container_cluster.cluster.master_auth[0].cluster_ca_certificate)
  value = var.cluster_create ? base64decode(google_container_cluster.cluster.master_auth[0].cluster_ca_certificate) : null
}
