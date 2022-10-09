terraform {
  #required_version = "~> 1.1.7"
  backend "gcs" {}

  required_providers {
    google = {
      source = "hashicorp/google"
      #version = "~> 3.43.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "~> 1.7.0"
    }
    helm = {
      source = "hashicorp/helm"
      #version = "~> 1.1.1"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region

  scopes = [
    # Default scopes
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/cloud-platform",

    # Required for google_client_openid_userinfo
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

