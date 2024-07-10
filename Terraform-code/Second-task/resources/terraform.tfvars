project_id = "my-project"

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
    percent         = 100
    latest_revision = false
  }
]