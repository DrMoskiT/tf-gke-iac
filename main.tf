terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.52"
    }
  }

  # КРОК 2 (після створення GCS bucket):
  # backend "gcs" {
  #   bucket = "your-bucket-name"  # TODO: заміни на свій bucket
  #   prefix = "terraform/state"
  # }
}

provider "google" {
  project = var.GOOGLE_PROJECT
  region  = var.GOOGLE_REGION
}

module "gke_cluster" {
  source         = "github.com/DrMoskiT/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}

output "kubeconfig_path" {
  description = "Шлях до kubeconfig, згенерованого модулем"
  value       = module.gke_cluster.kubeconfig
}
