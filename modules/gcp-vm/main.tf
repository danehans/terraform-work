terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.18"
    }
  }
  required_version = ">= 1.6"
}

data "google_compute_image" "image" {
  family = var.boot_image_family
  project = var.boot_image_project
}

resource "google_compute_instance" "vm" {
  name        = var.name
  machine_type = var.machine_type
  zone        = var.zone

  boot_disk {
    auto_delete = var.boot_disk_auto_delete
    mode        = "READ_WRITE"

    initialize_params {
      image = data.google_compute_image.image.self_link
      size  = var.boot_image_size
      type  = var.boot_disk_type
    }
  }

  labels = var.labels

  dynamic "service_account" {
    for_each = var.service_accounts == null ? [] : [var.service_accounts]
    content {
      email  = lookup(service_account.value, "service_email", null)
      scopes = lookup(service_account.value, "scopes", null)
    }
  }

  can_ip_forward = var.can_ip_forward
  network_interface {
    network            = var.network
    subnetwork         = var.subnetwork
    subnetwork_project = var.subnetwork_project
    network_ip         = var.network_ip
    stack_type         = var.stack_type
  }

  allow_stopping_for_update = var.allow_stopping_for_update
  description = var.description
  hostname = var.hostname
}