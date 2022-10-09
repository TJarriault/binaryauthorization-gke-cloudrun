# terraform

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.32.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gke_cluster"></a> [gke\_cluster](#module\_gke\_cluster) | ./modules/gke-cluster | n/a |
| <a name="module_gke_cluster_prod"></a> [gke\_cluster\_prod](#module\_gke\_cluster\_prod) | ./modules/gke-cluster | n/a |
| <a name="module_gke_service_account"></a> [gke\_service\_account](#module\_gke\_service\_account) | ./modules/gke-service-account | n/a |

## Resources

| Name | Type |
|------|------|
| [google_binary_authorization_attestor.attestor](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/binary_authorization_attestor) | resource |
| [google_binary_authorization_policy.policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/binary_authorization_policy) | resource |
| [google_container_analysis_note.note](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_analysis_note) | resource |
| [google_kms_crypto_key.crypto-key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_crypto_key) | resource |
| [google_kms_key_ring.keyring](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/kms_key_ring) | resource |
| [google_project_iam_member.attestorsViewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cryptoKeyDecrypter](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.notes_attacher](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.notes_viewer](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.signerVerifier](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_client_config.client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_kms_crypto_key_version.version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/kms_crypto_key_version) | data source |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_creation"></a> [cluster\_creation](#input\_cluster\_creation) | Create a cluster | `string` | `true` | no |
| <a name="input_cluster_creation_prod"></a> [cluster\_creation\_prod](#input\_cluster\_creation\_prod) | Create a cluster prod | `string` | `true` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Kubernetes cluster. | `string` | `"gke-cluster"` | no |
| <a name="input_cluster_name_prod"></a> [cluster\_name\_prod](#input\_cluster\_name\_prod) | The name of the Kubernetes cluster. | `string` | `"gke-cluster-prod"` | no |
| <a name="input_cluster_service_account_description"></a> [cluster\_service\_account\_description](#input\_cluster\_service\_account\_description) | Description of the custom service account used for the GKE cluster. | `string` | `"GKE Cluster Service Account managed by Terraform"` | no |
| <a name="input_cluster_service_account_name"></a> [cluster\_service\_account\_name](#input\_cluster\_service\_account\_name) | The name of the custom service account used for the GKE cluster. This parameter is limited to a maximum of 28 characters. | `string` | `"app-cluster-sa"` | no |
| <a name="input_project"></a> [project](#input\_project) | n/a | `string` | n/a | yes |
| <a name="input_project_env"></a> [project\_env](#input\_project\_env) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"europe-west1"` | no |
| <a name="input_region_id"></a> [region\_id](#input\_region\_id) | n/a | `string` | `"ew1"` | no |
| <a name="input_services"></a> [services](#input\_services) | list of required services | `list(string)` | <pre>[<br>  "container.googleapis.com",<br>  "binaryauthorization.googleapis.com",<br>  "cloudkms.googleapis.com",<br>  "clouddeploy.googleapis.com",<br>  "containeranalysis.googleapis.com",<br>  "ondemandscanning.googleapis.com"<br>]</pre> | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | `"europe-west1-b"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
