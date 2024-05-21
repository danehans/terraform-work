resource "google_container_cluster" "cluster" {
  name                = var.cluster_name
  location            = var.location
  network             = var.network
  subnetwork          = var.subnetwork
  project             = var.project
  deletion_protection = false # Need to set this so testing can clean itself up

  addons_config {
    http_load_balancing {
      disabled = false
    }
    network_policy_config {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = true
    }
  }

  vertical_pod_autoscaling {
    enabled = false
  }

  cluster_autoscaling {
    enabled = false
  }

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  # https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster#example-usage---with-a-separately-managed-node-pool-recommended
  remove_default_node_pool = true
  initial_node_count       = 1

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  monitoring_config {
    managed_prometheus {
      enabled = false
    }
  }

  resource_labels = var.labels
}