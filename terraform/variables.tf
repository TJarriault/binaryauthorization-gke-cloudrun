#################
### VARIABLES ###
#################

variable "project" {
  type = string
}

variable "project_env" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "region_id" {
  type    = string
  default = "ew1"
}

variable "zone" {
  type    = string
  default = "europe-west1-b"
}

variable "services" {
  description = "list of required services"
  type        = list(string)
  default     = ["container.googleapis.com", "binaryauthorization.googleapis.com", "cloudkms.googleapis.com", "clouddeploy.googleapis.com", "containeranalysis.googleapis.com", "ondemandscanning.googleapis.com"]
}


#===================
# GKE
#===================
variable "cluster_creation" {
  description = "Create a cluster"
  type        = string
  default     = true
}

variable "cluster_creation_prod" {
  description = "Create a cluster prod"
  type        = string
  default     = true
}


variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "gke-cluster"
}

variable "cluster_name_prod" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "gke-cluster-prod"
}


variable "cluster_service_account_name" {
  description = "The name of the custom service account used for the GKE cluster. This parameter is limited to a maximum of 28 characters."
  type        = string
  default     = "app-cluster-sa"
}

variable "cluster_service_account_description" {
  description = "Description of the custom service account used for the GKE cluster."
  type        = string
  default     = "GKE Cluster Service Account managed by Terraform"
}
