terraform {
  backend "gcs" {
    bucket  = "tfstate-bucket-8822"
    prefix  = "terraform/terraform-demo-357500"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.63.0"
    }
  }
}

provider "google" {
  project     = "terraform-demo-357500"
  region      = "us-central-1a"
  credentials = file("/Users/christopher.quiles/.ssh/credentials.json")
}

