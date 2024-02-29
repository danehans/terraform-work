# Use mostly defaults from variables.tf, but still allow overriding from command line
module "gcp-vm-rhel" {
  source = "../modules/gcp-vm"

  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  labels = var.labels
  network = var.network
  network_ip = var.network_ip
  provisioning_model = var.provisioning_model
  stack_type = var.stack_type
  subnetwork = var.subnetwork
  subnetwork_project = var.subnetwork_project
  service_accounts = var.service_accounts

  boot_image_family = var.boot_image_family
  boot_image_project = var.boot_image_project
  boot_image_size = var.boot_image_size
  boot_disk_auto_delete = var.boot_disk_auto_delete
  boot_disk_type = var.boot_disk_type

  can_ip_forward = var.can_ip_forward
  allow_stopping_for_update = var.allow_stopping_for_update
  description = var.description
  hostname = var.hostname

  startup-script = local.startup_script
}

locals {
  script_name = var.is-fips ? "startup-fips.sh" : var.startup-script
  startup_script = local.script_name != "" ? file(local.script_name) : ""
}