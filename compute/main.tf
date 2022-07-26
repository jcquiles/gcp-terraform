resource "google_compute_instance" "default" { 
  name         = "terraform-demo"
  machine_type = "e2-small"
  zone         = "asia-southeast1-a"

  tags = ["sql-db"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "terraform-demo-vpc"

    access_config {
      // Ephemeral public IP
    }
  }
}