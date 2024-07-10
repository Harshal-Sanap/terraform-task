<!-- BEGIN_TF_DOCS -->
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
| [google_cloud_run_service.simple-app](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service) | resource |
| [google_cloud_run_service_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_service_iam_policy) | resource |
| [google_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_policy) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image"></a> [image](#input\_image) | The container image to deploy. | `string` | n/a | yes |
| <a name="input_latest_revision"></a> [latest\_revision](#input\_latest\_revision) | Whether to send traffic to the latest revision. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the Cloud Run service will be created. | `string` | `"us-central1"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Cloud Run service. | `string` | n/a | yes |
| <a name="input_percent"></a> [percent](#input\_percent) | The percentage of traffic to direct to this revision. | `number` | `100` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which to create the Cloud Run service. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region in which to create the Cloud Run service. | `string` | `"us-central1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the created service. |
| <a name="output_location"></a> [location](#output\_location) | Location of the service. |
| <a name="output_name"></a> [name](#output\_name) | Name of the service. |
| <a name="output_url"></a> [url](#output\_url) | Endpoint of the cloud-run service. |
<!-- END_TF_DOCS -->