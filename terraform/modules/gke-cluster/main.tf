resource "google_container_cluster" "cluster" {
  #count = var.cluster_create ? 1 : 0
  name        = var.cluster_name
  description = var.description

  project  = var.project
  location = var.location

  logging_service    = var.logging_service
  monitoring_service = var.monitoring_service
  min_master_version = local.kubernetes_version

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = var.node_master_count

  # We can optionally control access to the cluster
  # See https://cloud.google.com/kubernetes-engine/docs/how-to/private-clusters
  private_cluster_config {
    enable_private_endpoint = var.disable_public_endpoint
  }

  addons_config {
    http_load_balancing {
      disabled = !var.http_load_balancing
    }

    horizontal_pod_autoscaling {
      disabled = !var.horizontal_pod_autoscaling
    }

  }

  vertical_pod_autoscaling {
    enabled = var.enable_vertical_pod_autoscaling
  }

  binary_authorization {
    evaluation_mode = "PROJECT_SINGLETON_POLICY_ENFORCE"

  }


  resource_labels = var.resource_labels
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  #count = var.cluster_create ? 1 : 0
  name       = "${var.cluster_name}-node-pool"
  location   = var.location
  cluster    = google_container_cluster.cluster.name
  node_count = var.node_count

  autoscaling {
    min_node_count = var.node_count
    max_node_count = "5"
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.google_service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


# ---------------------------------------------------------------------------------------------------------------------
# Prepare locals to keep the code cleaner
# ---------------------------------------------------------------------------------------------------------------------

locals {
  latest_version     = data.google_container_engine_versions.location.latest_master_version
  kubernetes_version = var.kubernetes_version != "latest" ? var.kubernetes_version : local.latest_version
}

# ---------------------------------------------------------------------------------------------------------------------
# Pull in data
# ---------------------------------------------------------------------------------------------------------------------

// Get available master versions in our location to determine the latest version
data "google_container_engine_versions" "location" {
  location = var.location
  project  = var.project
}

