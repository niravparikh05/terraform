module "gke" {
  source                     = "../../modules/gke"
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  zones                      = var.zones
  network                    = var.network
  subnetwork                 = var.subnetwork
  http_load_balancing        = var.http_load_balancing
  horizontal_pod_autoscaling = var.horizontal_pod_autoscaling
  create_service_account     = var.create_service_account
  regional                   = var.regional
  node_pools                 = var.node_pools
  service_account            = var.service_account
  network_project_id         = var.network_project_id
}
