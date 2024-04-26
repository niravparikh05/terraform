project_id             = ""
cluster_name           = "inception"
region                 = "us-east1"
zones                  = ["us-east1-b", "us-east1-c"]
network                = ""
subnetwork             = ""
create_service_account = false
name                   = "inception" #name for a tags  
regional               = "true"
node_pools = [
  {
    name               = "inception-node-pool"
    machine_type       = "e2-medium"
    node_locations     = "us-east1-b,us-east1-c"
    local_ssd_count    = 0
    spot               = false
    disk_size_gb       = 100
    disk_type          = "pd-standard"
    image_type         = "COS_CONTAINERD"
    service_account    = ""
    initial_node_count = 2
  }
]