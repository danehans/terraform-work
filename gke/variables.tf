variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
  default     = "dhawton"
}

variable "location" {
  description = "The location of the GKE cluster"
  type        = string
  default     = "us-east1-c"
}

variable "network" {
  description = "The network for the GKE cluster"
  type        = string
  default     = "projects/solo-oss/global/networks/default"
}

variable "subnetwork" {
  description = "The subnetwork for the GKE cluster"
  type        = string
  default     = "projects/solo-oss/regions/us-east1/subnetworks/default"

}

variable "project" {
  description = "The GCP project"
  type        = string
  default     = "solo-oss"
}

variable "node_pool_name" {
  description = "The name of the GKE node pool"
  type        = string
  default     = "default-pool"
}

variable "node_pool_machine_type" {
  description = "The machine type for the GKE node pool"
  type        = string
  default     = "e2-standard-8"
}

variable "node_pool_disk_size" {
  description = "The disk size for the GKE node pool"
  type        = number
  default     = 100
}

variable "node_pool_disk_type" {
  description = "The disk type for the GKE node pool"
  type        = string
  default     = "pd-standard"
}

variable "labels" {
  type        = map(string)
  description = "A set of key/value label pairs to assign to the instance."
  default = {
    created-by = "daniel_hawton"
    team       = "oss"
  }
}

variable "node_pool_max_node_count" {
  description = "The maximum number of nodes for the GKE node pool"
  type        = number
  default     = 5
}

variable "node_pool_min_node_count" {
  description = "The minimum number of nodes for the GKE node pool"
  type        = number
  default     = 1
}

variable "node_pool_node_count" {
  description = "The number of nodes for the GKE node pool"
  type        = number
  default     = 3
}

variable "node_pool_image_type" {
  description = "The image type for the GKE node pool"
  type        = string
  default     = "COS_CONTAINERD"
}
