output "cluster_id" {
  value       = module.gke.cluster_id
  description = "Cluster ID"
}
output "name" {
  value       = module.gke.name
  description = "Cluster name"
}
output "endpoint" {
  value       = module.gke.endpoint
  description = "Cluster endpoint"
  sensitive   = true
}
output "http_load_balancing_enabled" {
  value       = module.gke.http_load_balancing_enabled
  description = "Whether http load balancing enabled"
}
output "identity_namespace" {
  value       = module.gke.identity_namespace
  description = "Workload Identity pool"
}
output "location" {
  value       = module.gke.location
  description = "Cluster location (region if regional cluster, zone if zonal cluster)"
}
output "type" {
  value       = module.gke.type
  description = "Description: Cluster type (regional / zonal)"
}
output "service_account" {
  value       = module.gke.service_account
  description = "The service account to default running nodes as if not overridden in `node_pools`."
}
output "node_pools_names" {
  value       = module.gke.node_pools_names
  description = "list of node pools names"
}
output "node_pools_versions" {
  value       = module.gke.node_pools_versions
  description = "Node pool versions by node pool name"
}
output "master_version" {
  value       = module.gke.master_version
  description = " Current master kubernetes version"
}