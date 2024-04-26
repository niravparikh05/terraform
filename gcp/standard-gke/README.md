## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke"></a> [gke](#module\_gke) | ../modules/gke | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | name for your cluster | `string` | `"inception"` | no |
| <a name="input_create_service_account"></a> [create\_service\_account](#input\_create\_service\_account) | The service account to run nodes as if not overridden in node\_pools. The create\_service\_account variable default value (true) will cause a cluster-specific service account to be created. | `bool` | `false` | no |
| <a name="input_effect"></a> [effect](#input\_effect) | effect for node taint | `string` | `"PreferNoSchedule"` | no |
| <a name="input_filestore_csi_driver"></a> [filestore\_csi\_driver](#input\_filestore\_csi\_driver) | The status of the Filestore CSI driver addon, which allows the usage of filestore instance as volumes | `bool` | `false` | no |
| <a name="input_horizontal_pod_autoscaling"></a> [horizontal\_pod\_autoscaling](#input\_horizontal\_pod\_autoscaling) | Enable horizontal pod autoscaling addon | `bool` | `true` | no |
| <a name="input_http_load_balancing"></a> [http\_load\_balancing](#input\_http\_load\_balancing) | Enable httpload balancer addon | `bool` | `false` | no |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | The name of the secondary subnet ip range to use for pods | `string` | `""` | no |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | The name of the secondary subnet range to use for services | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | name of a node pool | `string` | `"inception"` | no |
| <a name="input_network"></a> [network](#input\_network) | The VPC network to host the cluster in (required) | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Enable network policy addon | `bool` | `false` | no |
| <a name="input_network_project_id"></a> [network\_project\_id](#input\_network\_project\_id) | The project ID of the shared VPC's host (for shared vpc support) | `string` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | List of maps containing node pools | `list(map(any))` | <pre>[<br>  {<br>    "auto_repair": true,<br>    "auto_upgrade": true,<br>    "disk_size_gb": 100,<br>    "disk_type": "pd-standard",<br>    "enable_gcfs": false,<br>    "enable_gvnic": false,<br>    "image_type": "COS_CONTAINERD",<br>    "initial_node_count": 1,<br>    "local_ssd_count": 0,<br>    "machine_type": "e2-medium",<br>    "max_count": 100,<br>    "min_count": 1,<br>    "name": "inception-node-pool",<br>    "node_locations": "us-east1-b,us-east1-c",<br>    "preemptible": false,<br>    "service_account": "",<br>    "spot": false<br>  }<br>]</pre> | no |
| <a name="input_node_pools_oauth_scopes"></a> [node\_pools\_oauth\_scopes](#input\_node\_pools\_oauth\_scopes) | Map of lists containing node oauth scopes by node-pool name | `map(list(string))` | <pre>{<br>  "all": [<br>    "https://www.googleapis.com/auth/logging.write",<br>    "https://www.googleapis.com/auth/monitoring"<br>  ]<br>}</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID of a project your working on | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in (optional if zonal cluster / required if regional) | `string` | n/a | yes |
| <a name="input_regional"></a> [regional](#input\_regional) | Whether is a regional cluster (zonal cluster if set false. WARNING: changing this after cluster creation is destructive!) | `bool` | `true` | no |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The service account to run nodes as if not overridden in `node_pools`. The create\_service\_account variable default value (true) will cause a cluster-specific service account to be created. | `string` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | The subnetwork to host the cluster in (required) | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | The zones to host the cluster in (optional if regional cluster / required if zonal) | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | Cluster ID |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Cluster endpoint |
| <a name="output_http_load_balancing_enabled"></a> [http\_load\_balancing\_enabled](#output\_http\_load\_balancing\_enabled) | Whether http load balancing enabled |
| <a name="output_identity_namespace"></a> [identity\_namespace](#output\_identity\_namespace) | Workload Identity pool |
| <a name="output_location"></a> [location](#output\_location) | Cluster location (region if regional cluster, zone if zonal cluster) |
| <a name="output_master_version"></a> [master\_version](#output\_master\_version) | Current master kubernetes version |
| <a name="output_name"></a> [name](#output\_name) | Cluster name |
| <a name="output_node_pools_names"></a> [node\_pools\_names](#output\_node\_pools\_names) | list of node pools names |
| <a name="output_node_pools_versions"></a> [node\_pools\_versions](#output\_node\_pools\_versions) | Node pool versions by node pool name |
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | The service account to default running nodes as if not overridden in `node_pools`. |
| <a name="output_type"></a> [type](#output\_type) | Description: Cluster type (regional / zonal) |

##Access your cluster

Configure gcloud to computer cli using link [here](https://cloud.google.com/sdk/docs/install)

Run following command to access you cluster if it's a regional type
`gcloud container clusters get-credentials <cluster-name>  --project <project-id> --region=<region>`

Run following command to access you cluster if it's a zonal type
`gcloud container clusters get-credentials <cluster-name>  --project <project-id> --zone=<zone>`