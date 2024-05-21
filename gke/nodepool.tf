resource "google_container_node_pool" "cluster_node_pool" {
  autoscaling {
    min_node_count = var.node_pool_min_node_count
    max_node_count = var.node_pool_max_node_count
  }

  name           = var.node_pool_name
  cluster        = google_container_cluster.cluster.name
  node_count     = var.node_pool_node_count
  node_locations = [var.location]
  project        = var.project
  location       = var.location

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    machine_type = var.node_pool_machine_type

    disk_size_gb = var.node_pool_disk_size
    disk_type    = var.node_pool_disk_type
    image_type   = var.node_pool_image_type

    labels = var.labels

    oauth_scopes    = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    service_account = "default"

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  upgrade_settings {
    max_surge       = 1
    max_unavailable = 0
  }
}