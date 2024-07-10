# Hello World Cloud Run Deployment

This project demonstrates how to deploy a simple "Hello World" application to Google Cloud Run using Terraform.

## Prerequisites

1. [Google Cloud SDK](https://cloud.google.com/sdk) installed and configured.
2. [Terraform](https://www.terraform.io/downloads.html) installed.
3. [GCP](https://cloud.google.com/shell)Cloud shell 
4. Enable these cloud APIs - CloudRun and artifcats-registry
## Steps

### 1. Create the Application
Create a simple hello-world application, you can refer the folder named hello-world-app which has file main.py

### 2. Create a Dockerfile
Create a Dockerfile which will build the application image and push it to the artifcats registry, this dockerfile can be found in folder hello-world-app.
#### Steps to build the image and push to artifcats registry
Note: Ive build the image in cloud shell as it Docker preinstalled.
1. Set the project_id using the command `gcloud config set project PROJECT_ID`
2. Build the image using the command `docker build -t hello-world-app .`
3. Tag the image using the command `docker tag hello-world-app gcr.io/PROJECT_ID/hello-world-app` 
4. Push the image to artifcats registry using command `docker push gcr.io/$PROJECT_ID/hello-world-app`

### 3. Create terraform configuration files
Create a folder and the terraform configuration files ( for code refer to simple-task folder)
```
simple-task/
    ├── main.tf
    ├── terraform.tfvars
    ├── variables.tf
    ├── outputs.tf
    └── README.md
```
1. main.tf 
2. variables.tf 
3. outputs.tf 
4. provider.tf 
5. terraform.tfvars

###### 1. main.tf - main.tf file has the code for Cloud run resource.
###### 2. variables.tf - variables.tf file has the variables which are used in main.tf file.
###### 3. outputs.tf - outputs.tf file has the output variables which are used in main.tf.
###### 4. provider.tf - provider.tf file has the provider details.
###### 5. terraform.tfvars - terraform.tfvars file has the variables values and with these values our resource will be created.

### 4. Initialize and apply the terraform configuration
1. Initialize the terraform configuration using the command `terraform init`
2. Plan the output of configuration using the command `terraform plan`
3. Apply the terraform configuration using the command `terraform apply`
4. Destroy the terraform configuration using the command `terraform destroy`

### 5. Usage: 
You can go to the simple-task folder, and for main.tf attributes you can use terraform.tfvars
```
project_id      = "my-project" \\ update this with actual value.
region          = "us-central1"
name            = "hello-world-app"
location        = "us-central1"
image           = "gcr.io/my-project/hello-world-app"
percent         = 100
latest_revision = true
```
1. Run `terraform init` to Initialize.
2. Run `terraform plan` to plan the configuration.
3. Run `terraform apply` to apply the configuration.
4. Run `terraform destroy` to destroy created resources.
### 6. Publically accessible URL :  https://hello-world-app-zpfbh62leq-uc.a.run.app

`Sample configuration can be found in plan.txt`
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.37.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.37.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_run_service.simple-app](https://registry.terraform.io/providers/hashicorp/google/5.37.0/docs/resources/cloud_run_service) | resource |
| [google_cloud_run_service_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/5.37.0/docs/resources/cloud_run_service_iam_policy) | resource |
| [google_iam_policy.noauth](https://registry.terraform.io/providers/hashicorp/google/5.37.0/docs/data-sources/iam_policy) | data source |

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