variable "project" {
  description = "The project in which the resource belongs."
  type        = string
  default     = "solo-oss"
}

variable "zone" {
  type        = string
  description = "The zone in which the resource resides."
  default     = "us-west4-b"
}

variable "machine_type" {
  type        = string
  description = "The machine type to create"
  default     = "e2-standard-32"
}

variable "name" {
  description = "The name of the VM"
  type        = string
  default     = "dhansen"
}

variable "labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the instance."
  default = {
    created-by = "daneyon_hansen"
    team       = "oss"
  }
}

variable "network" {
  type        = string
  description = "The network to attach this interface to. Either network or subnetwork must be provided."
  default     = "default"
}

variable "network_ip" {
  type        = string
  description = "The private IP address to assign to the instance. If empty, the address will be automatically assigned."
  default     = ""
}

variable "provisioning_model" {
  type        = string
  description = "Describe the type of preemptible VM. This field accepts the value STANDARD or SPOT"
  default     = "STANDARD"
}

variable "stack_type" {
  type        = string
  description = "Stack type to use, to know whether or not to enable IPv6."
  default     = "IPV4_ONLY"
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to attach this interface to. Either network or subnetwork must be provided."
  default     = null
}

variable "subnetwork_project" {
  type        = string
  description = "The project in which the subnetwork is located. If not provided, the provider project is used."
  default     = null
}

variable "service_accounts" {
  type = object({
    service_email = optional(string, null)
    scopes        = optional(set(string), [])
  })
  default     = {}
  description = "Service account and scopes that will be associated with the GCE instance."
}

variable "boot_disk_auto_delete" {
  type        = bool
  description = "Whether the disk will be auto-deleted when the instance is deleted."
  default     = true
}

###################################################################################
# Family and project selections determine where to pull images
# We stick to family and project to ensure we get the latest version of the image
#
# see `gcloud compute images list` for a list of available images
###################################################################################
variable "boot_image_family" {
  description = "The family of the image to use for the VM"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "boot_image_project" {
  description = "The project of the image to use for the VM"
  type        = string
  default     = "ubuntu-os-cloud"
}

variable "boot_image_size" {
  description = "The size of the boot disk in GB"
  type        = number
  default     = 150
}

variable "boot_disk_type" {
  description = "The type of the boot disk"
  type        = string
  default     = "pd-balanced"
}

variable "can_ip_forward" {
  description = "Whether the VM can forward traffic"
  type        = bool
  default     = false
}

variable "allow_stopping_for_update" {
  description = "Whether the VM can be stopped for update"
  type        = bool
  default     = false
}

variable "description" {
  description = "The description of the VM"
  type        = string
  default     = ""
}

variable "hostname" {
  description = "The hostname of the VM"
  type        = string
  default     = "solo-system-dhansen.local"
}
