resource "google_project_service" "compute" {
  service ="compute.googleapis.com"
}
resource "google_project_service" "container" {
  service ="container.googleapis.com"
}


module "network" {
  source ="./network"

  NETWORK = var.NETWORK
  REGION = var.REGION
  gcp_service_compute = google_project_service.compute
  gcp_service_container = google_project_service.container
}

module "cluster" {
  source ="./cluster"

network = module.network.network_link
subnetwork = module.network.subnet_link

}

