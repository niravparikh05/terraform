variable "project_id" {
  description = "Project ID of a project your working on"

}
variable "cluster_name" {
  description = "name for your cluster"
  default     = "inception"
}
variable "service_account" {
  type        = string
  description = "The service account to run nodes as if not overridden in `node_pools`. The create_service_account variable default value (true) will cause a cluster-specific service account to be created."

}
variable "region" {
  type        = string
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)"
  default     = "us-central1"
}
variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = ["us-central1-a"]
}
variable "network" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
  default     = "default"
}
variable "network_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
  default     = "default"
}
variable "name" {
  default = "inception"
}
variable "http_load_balancing" {
  type        = bool
  default     = false
  description = "Enable httpload balancer addon"
}
variable "network_policy" {
  type        = bool
  default     = false
  description = "Enable network policy addon"
}
variable "horizontal_pod_autoscaling" {
  type        = bool
  default     = true
  description = "Enable horizontal pod autoscaling addon"
}
variable "filestore_csi_driver" {
  type        = bool
  default     = false
  description = "The status of the Filestore CSI driver addon, which allows the usage of filestore instance as volumes"
}
variable "create_service_account" {
  type        = bool
  default     = false
  description = "The service account to run nodes as if not overridden in node_pools. The create_service_account variable default value (true) will cause a cluster-specific service account to be created."
}
variable "ip_range_pods" {
  type        = string
  default     = ""
  description = "The name of the secondary subnet ip range to use for pods"
}
variable "ip_range_services" {
  type        = string
  default     = ""
  description = "The name of the secondary subnet range to use for services"

}
variable "regional" {
  type        = bool
  default     = true
  description = "Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!)"
}
variable "effect" {
  type        = string
  description = "effect for node taint"
  default     = "PreferNoSchedule"
}
variable "node_pools_oauth_scopes" {
  type        = map(list(string))
  description = "Map of lists containing node oauth scopes by node-pool name"
  default = {
    all = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }
}
variable "node_pools" {
  type        = list(map(any))
  description = "List of maps containing node pools"
  default = [
    {
      name               = "inception-node-pool"
      machine_type       = "e2-medium"
      node_locations     = "us-east1-b,us-east1-c"
      min_count          = 1
      max_count          = 100
      local_ssd_count    = 0
      spot               = false
      disk_size_gb       = 100
      disk_type          = "pd-standard"
      image_type         = "COS_CONTAINERD"
      enable_gcfs        = false
      enable_gvnic       = false
      auto_repair        = true
      auto_upgrade       = true
      service_account    = ""
      preemptible        = false
      initial_node_count = 1
    },
  ]
}
