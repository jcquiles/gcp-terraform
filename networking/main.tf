resource "google_compute_network" "vpc_network" {
  project                 = "terraform-demo-357500"
  name                    = "terraform-demo-vpc"
  auto_create_subnetworks = true
  mtu                     = 1460
}