data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.cluster_name
  region                     = var.region
  zones                      = var.zones
  network                    = var.network
  subnetwork                 = var.subnetwork
  ip_range_pods              = var.ip_range_pods
  ip_range_services          = var.ip_range_services
  http_load_balancing        = var.http_load_balancing
  network_policy             = var.network_policy
  horizontal_pod_autoscaling = var.horizontal_pod_autoscaling
  filestore_csi_driver       = var.filestore_csi_driver
  create_service_account     = var.create_service_account
  regional                   = var.regional
  node_pools                 = var.node_pools
  node_pools_oauth_scopes    = local.node_pools_oauth_scopes
  node_pools_labels          = local.node_pools_labels
  node_pools_metadata        = local.node_pools_metadata
  node_pools_taints          = local.node_pools_taints
  node_pools_tags            = local.node_pools_tags
}