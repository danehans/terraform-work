output "cpu_platform" {
  value       = google_compute_instance.vm.cpu_platform
  description = "The CPU platform of the VM instance"
}

output "current_status" {
  value       = google_compute_instance.vm.current_status
  description = "Current status of the VM instance"
}

output "id" {
  value       = google_compute_instance.vm.id
  description = "An identifier for the resource"
}

output "instance_id" {
  value       = google_compute_instance.vm.instance_id
  description = "The server-assigned unique identifier of this instance"
}

output "machine_type" {
  value       = google_compute_instance.vm.machine_type
  description = "Type of the machine created"
}

output "min_cpu_platform" {
  value       = google_compute_instance.vm.min_cpu_platform
  description = "Minimum CPU platform for the VM instance"
}

output "name" {
  value       = google_compute_instance.vm.name
  description = "Unique name of the instance created"
}

output "self_link" {
  value       = google_compute_instance.vm.self_link
  description = "The URI of the created resource"
}

output "boot_disk_size" {
  value       = google_compute_instance.vm.boot_disk[0].initialize_params[0].size
  description = "Size of the boot disk of the instance"
}

output "private_ip" {
  value       = google_compute_instance.vm.network_interface[0].network_ip
  description = "Internal IP address of the instance"
}

output "public_ip" {
  value       = google_compute_instance.vm.network_interface[0].access_config.*.nat_ip
  description = "Public IP address of the instance"
}