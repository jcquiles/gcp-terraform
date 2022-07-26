provider "google" {
  project     = "terraform-demo-357500"
  region      = "asia-southeast1-a"
  credentials = file("credentials.json")
  zone        = "asia-southeast1-a"
}