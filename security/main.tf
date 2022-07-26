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

  source_ranges = ["10.0.0/24"] # needs to be changed

  target_tags = ["sql-db"]
}
