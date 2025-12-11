terraform {
  required_version = ">= 1.3.0"

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }

  backend "gcs" {
    bucket = "vk-tf-state-lateral-linker-475709-t4"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.GOOGLE_PROJECT
  region  = var.GOOGLE_REGION
}

module "gke_cluster" {
  source         = "github.com/DrMoskiT/tf-google-gke-cluster"
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GOOGLE_REGION  = var.GOOGLE_REGION
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}
