#compute
resource "google_compute_instance" "default" { 
  name         = "terraform-demo"
  machine_type = "e2-small"
  zone         = "asia-southeast1-a"

  tags = ["sql-db"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "terraform-demo-vpc"

    access_config {
      // Ephemeral public IP
    }
  }
}

#networking
resource "google_compute_network" "vpc_network" {
  project                 = "terraform-demo-357500"
  name                    = "terraform-demo-vpc"
  auto_create_subnetworks = true
  mtu                     = 1460
}

#security
resource "google_compute_firewall" "default" {
  name    = "sql-db-access"
  network = "terraform-demo-vpc"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["1433", "8080", "443", "22"]
  }

  direction = "INGRESS"

  source_ranges = ["10.148.0.0/20"] # needs to be changed

  target_tags = ["sql-db"]
}