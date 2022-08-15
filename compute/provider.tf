provider "google" {
  project     = "terraform-demo-357500"
  region      = "asia-southeast1-a"
  credentials = file("/Users/christopher.quiles/.ssh/credentials.json")
  zone        = "asia-southeast1-a"
}