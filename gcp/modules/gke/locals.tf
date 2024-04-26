locals {
  node_pools_oauth_scopes = var.node_pools_oauth_scopes
  node_pools_labels = {
    all = {}

    "${var.name}" = {
      "${var.name}" = true
    }
  }
  node_pools_metadata = {
    all = {}

    "${var.name}" = {
      node-pool-metadata-custom-value = "${var.name}-node-pool"
    }
  }
  node_pools_taints = {
    all = []

    "${var.name}" = [
      {
        key    = "${var.name}"
        value  = true
        effect = "${var.effect}"
      },
    ]
  }
  node_pools_tags = {
    all = []

    "${var.name}" = [
      "${var.name}-node-pool",
    ]
  }
}
