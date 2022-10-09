# ---------------------------------------------------------------------------------------------------------------------
# CREATE GKE Cluster
# ---------------------------------------------------------------------------------------------------------------------
module "gke_cluster" {
  source         = "./modules/gke-cluster"
  cluster_create = var.cluster_creation

  cluster_name = format("%s-%s", var.project, var.cluster_name)

  project  = var.project
  location = var.region


  # In production, we highly recommend restricting access to only within the network boundary, requiring your users to use a bastion host or VPN.
  disable_public_endpoint = "false"

  # add resource labels to the cluster
  resource_labels = {
    environment = "testing"
  }

  # Cluster master node
  node_master_count = 1

  # container node pool
  node_count = 1

  # SA
  google_service_account_email = module.gke_service_account.email
}

module "gke_cluster_prod" {
  source         = "./modules/gke-cluster"
  cluster_create = var.cluster_creation_prod

  cluster_name = format("%s-%s", var.project, var.cluster_name_prod)

  project  = var.project
  location = var.region


  # In production, we highly recommend restricting access to only within the network boundary, requiring your users to use a bastion host or VPN.
  disable_public_endpoint = "false"

  # add resource labels to the cluster
  resource_labels = {
    environment = "production"
  }

  # Cluster master node
  node_master_count = 1

  # container node pool
  node_count = 1

  # SA
  google_service_account_email = module.gke_service_account.email
}


# ---------------------------------------------------------------------------------------------------------------------
# CREATE A CUSTOM SERVICE ACCOUNT TO USE WITH THE GKE CLUSTER
# ---------------------------------------------------------------------------------------------------------------------

module "gke_service_account" {
  source         = "./modules/gke-service-account"
  cluster_create = var.cluster_creation

  name        = var.cluster_service_account_name
  project     = var.project
  description = var.cluster_service_account_description
}
