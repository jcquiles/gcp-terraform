terraform {
   backend "gcs" {
     bucket  = "gke-autopilot-bucket"
     prefix  = "terraform/gke"
   }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.63.0"
    }
  }
}