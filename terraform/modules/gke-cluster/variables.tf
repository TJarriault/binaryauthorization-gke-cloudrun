# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID to host the cluster in"
  type        = string
}

variable "location" {
  description = "The location (region or zone) to host the cluster in"
  type        = string
}

variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
}

variable "node_master_count" {
  description = "Number of master node"
  type        = number
  default     = 1
}

variable "node_count" {
  description = "Number of secondary node"
  type        = number
  default     = 1
}


variable "cluster_create" {
  description = "cluster creation"
  type        = string
  default     = true
}



# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# Generally, these values won't need to be changed.
# ---------------------------------------------------------------------------------------------------------------------

variable "disable_public_endpoint" {
  description = "Control whether the master's internal IP address is used as the cluster endpoint. If set to 'true', the master can only be accessed from internal IP addresses."
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the cluster"
  type        = string
  default     = ""
}

variable "kubernetes_version" {
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
  type        = string
  default     = "latest"
}

variable "logging_service" {
  description = "The logging service that the cluster should write logs to. Available options include logging.googleapis.com/kubernetes, logging.googleapis.com (legacy), and none"
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}

variable "monitoring_service" {
  description = "The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Stackdriver Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting. Available options include monitoring.googleapis.com/kubernetes, monitoring.googleapis.com (legacy), and none"
  type        = string
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "horizontal_pod_autoscaling" {
  description = "Whether to enable the horizontal pod autoscaling addon"
  type        = bool
  default     = true
}

variable "http_load_balancing" {
  description = "Whether to enable the http (L7) load balancing addon"
  type        = bool
  default     = true
}

variable "enable_private_nodes" {
  description = "Control whether nodes have internal IP addresses only. If enabled, all nodes are given only RFC 1918 private addresses and communicate with the master via private networking."
  type        = bool
  default     = false
}

variable "enable_vertical_pod_autoscaling" {
  description = "Whether to enable Vertical Pod Autoscaling"
  type        = string
  default     = false
}

variable "google_service_account_email" {
  description = "Service account"
  type        = string
}

variable "resource_labels" {
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster."
  type        = map(any)
  default     = {}
}

