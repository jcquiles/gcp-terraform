terraform {
  backend "gcs" {
    bucket  = "tfstate-bucket-8822"
    prefix  = "terraform/state"
  }
}