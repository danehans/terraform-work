terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.18"
    }
  }
  required_version = ">= 1.6"
}

provider "google" {
  project = var.project
  zone    = var.zone
}
