terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
  required_version = ">= 1.6"
}

# Configure the Google Cloud provider
# Credentials will be populated via the GOOGLE_CREDENTIALS environment variable
# see https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
# These are defaults, not really needed as we do set them for the individual resources.
provider "google" {
  project = "istio-enterprise"
  region  = "us-east1"
  zone    = "us-east1-c"
}