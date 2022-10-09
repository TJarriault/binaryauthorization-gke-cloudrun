# gke-service-account

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
| [google_project_iam_member.service_account-roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_create"></a> [cluster\_create](#input\_cluster\_create) | cluster creation | `string` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the custom service account. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the custom service account. This parameter is limited to a maximum of 28 characters. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the GCP Project where all resources will be launched. | `string` | n/a | yes |
| <a name="input_service_account_roles"></a> [service\_account\_roles](#input\_service\_account\_roles) | Additional roles to be added to the service account. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_email"></a> [email](#output\_email) | The email address of the custom service account. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
