# gke-cluster

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.primary_preemptible_nodes](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_container_engine_versions.location](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_engine_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_create"></a> [cluster\_create](#input\_cluster\_create) | cluster creation | `string` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the cluster | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the cluster | `string` | `""` | no |
| <a name="input_disable_public_endpoint"></a> [disable\_public\_endpoint](#input\_disable\_public\_endpoint) | Control whether the master's internal IP address is used as the cluster endpoint. If set to 'true', the master can only be accessed from internal IP addresses. | `bool` | `false` | no |
| <a name="input_enable_private_nodes"></a> [enable\_private\_nodes](#input\_enable\_private\_nodes) | Control whether nodes have internal IP addresses only. If enabled, all nodes are given only RFC 1918 private addresses and communicate with the master via private networking. | `bool` | `false` | no |
| <a name="input_enable_vertical_pod_autoscaling"></a> [enable\_vertical\_pod\_autoscaling](#input\_enable\_vertical\_pod\_autoscaling) | Whether to enable Vertical Pod Autoscaling | `string` | `false` | no |
| <a name="input_google_service_account_email"></a> [google\_service\_account\_email](#input\_google\_service\_account\_email) | Service account | `string` | n/a | yes |
| <a name="input_horizontal_pod_autoscaling"></a> [horizontal\_pod\_autoscaling](#input\_horizontal\_pod\_autoscaling) | Whether to enable the horizontal pod autoscaling addon | `bool` | `true` | no |
| <a name="input_http_load_balancing"></a> [http\_load\_balancing](#input\_http\_load\_balancing) | Whether to enable the http (L7) load balancing addon | `bool` | `true` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region. | `string` | `"latest"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location (region or zone) to host the cluster in | `string` | n/a | yes |
| <a name="input_logging_service"></a> [logging\_service](#input\_logging\_service) | The logging service that the cluster should write logs to. Available options include logging.googleapis.com/kubernetes, logging.googleapis.com (legacy), and none | `string` | `"logging.googleapis.com/kubernetes"` | no |
| <a name="input_monitoring_service"></a> [monitoring\_service](#input\_monitoring\_service) | The monitoring service that the cluster should write metrics to. Automatically send metrics from pods in the cluster to the Stackdriver Monitoring API. VM metrics will be collected by Google Compute Engine regardless of this setting. Available options include monitoring.googleapis.com/kubernetes, monitoring.googleapis.com (legacy), and none | `string` | `"monitoring.googleapis.com/kubernetes"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of secondary node | `number` | `1` | no |
| <a name="input_node_master_count"></a> [node\_master\_count](#input\_node\_master\_count) | Number of master node | `number` | `1` | no |
| <a name="input_project"></a> [project](#input\_project) | The project ID to host the cluster in | `string` | n/a | yes |
| <a name="input_resource_labels"></a> [resource\_labels](#input\_resource\_labels) | The GCE resource labels (a map of key/value pairs) to be applied to the cluster. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | Public certificate used by clients to authenticate to the cluster endpoint. |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Private key used by clients to authenticate to the cluster endpoint. |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | The public certificate that is the root of trust for the cluster. |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | The IP address of the cluster master. |
| <a name="output_master_version"></a> [master\_version](#output\_master\_version) | The Kubernetes master version. |
| <a name="output_name"></a> [name](#output\_name) | The name of the cluster master. This output is used for interpolation with node pools, other modules. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
