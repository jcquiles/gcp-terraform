resource "google_storage_bucket" "auto-expire" {
  name = var.bucket_name
  location = "US"
  force_destroy = true
  labels = var.labels
  encryption = {
    default_kms_key_name = var.kms_key_id
  }
  versioning {
    enabled = true
  }
}