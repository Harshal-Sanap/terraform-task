# Terraform with Modular Architecture
This document helps how to develop a reusable Terraform module which can be used to setup common infrastructure components
## What this document covers
1. Terraform Modular Architecture.
2. Terraform module to setup VPC, Subnet and Cloud-run service.
3. Compatibilty 
4. Usage

### 1. Terraform modular architecture
Terraform modules are a way to organize your Terraform configuration into reusable components.
#### Benifits of using Modules
##### 1.1. Reusability: We can use a single module to create multiple resources.
##### 1.2. Maintainability: Modules help keep things neat and separate.
##### 1.3. Simplicity: Modules make complex setups easier to handle.

### 2. Terraform module setup for VPC , Subnets & Cloud-run service
#### 2.1. Module structure
```
Second-task/
├── modules/
│   ├── cloud-run/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   └── ...
└── resources/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── README.md
```
#### 2.2. Terraform Network Module
##### To create above resources follow the folder structure shown above.
It supports creating:

##### 1. Google Virtual Private Network (VPC)
##### 2.Subnets within the VPC
##### 3.Secondary ranges for the subnets (if applicable)

### 3. Compatibility
This module is meant for use with Terraform 1.3+ and tested using Terraform 1.4+. If you find incompatibilities using Terraform >=1.3, please open an issue.

### 4. Usage 
You can go to the resource folder, however the usage of the module in main.tf could be like this in your own terraform.tfvars file:
```project_id = "my-project"

networking = [
  {
    network_name                           = "harshal-network-1"
    description                            = "primary network"
    auto_create_subnetworks                = false
    routing_mode                           = "GLOBAL"
    delete_default_internet_gateway_routes = true
    mtu                                    = 1460
    subnet_name                            = "us-central-subnet-1"
    subnet_ip                              = "10.0.0.0/24"
    subnet_region                          = "us-central1"
    private_ip_google_access               = true
  },
  {
    network_name                           = "harshal-network-2"
    description                            = "secondary network"
    auto_create_subnetworks                = false
    routing_mode                           = "REGIONAL"
    delete_default_internet_gateway_routes = false
    mtu                                    = 1500
    subnet_name                            = "us-central-subnet-1"
    subnet_ip                              = "10.2.0.0/24"
    subnet_region                          = "us-east1"
    private_ip_google_access               = false
  }
]

cloud_run_services = [
  {
    name            = "hello-world-1"
    region          = "us-central1"
    location        = "us-central1"
    image           = "gcr.io/your-project-id/service1:latest"
    percent         = 100
    latest_revision = true
  },
  {
    name            = "hello-world"
    region          = "us-east1"
    location        = "us-east1"
    image           = "gcr.io/your-project-id/service2:latest"
    percent         = 50
    latest_revision = false
  }
]
just update the project_id to actual project id of the project
```
` Sample usage configuration can be checked in plan.txt`
1. Run `terraform init` to Initialize.
2. Run `terraform plan` to plan the configuration.
3. Run `terraform apply` to apply the configuration.
4. Run `terraform destroy` to destroy created resources.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 5.37.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloud_run_service"></a> [cloud\_run\_service](#module\_cloud\_run\_service) | ../modules/cloud-run | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ../modules/networking | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_run_services"></a> [cloud\_run\_services](#input\_cloud\_run\_services) | A list of Cloud Run service configurations. | <pre>list(object({<br>    name            = string<br>    region          = string<br>    location        = string<br>    image           = string<br>    percent         = number<br>    latest_revision = bool<br>  }))</pre> | n/a | yes |
| <a name="input_networking"></a> [networking](#input\_networking) | A list of network configurations. | <pre>list(object({<br>    network_name                           = string<br>    description                            = string<br>    auto_create_subnetworks                = bool<br>    routing_mode                           = string<br>    delete_default_internet_gateway_routes = bool<br>    mtu                                    = number<br>    subnet_name                            = string<br>    subnet_ip                              = string<br>    subnet_region                          = string<br>    private_ip_google_access               = bool<br>  }))</pre> | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the project in which to create the resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Name of the cloud run service |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | The ID of the network created |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | The name of the created subnetwork |
<!-- END_TF_DOCS -->