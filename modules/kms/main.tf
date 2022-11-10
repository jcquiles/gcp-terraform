data "google_project" "this" {

}

resource "google_kms_key_ring" "this" {
  project  = data.google_project.this.project_id
  name     = var.key_name
  location = "us-east1"
}

resource "google_kms_crypto_key" "this" {
  name = var.key_name
  key_ring = google_kms_key_ring.this.id
  labels = var.labels
}

data "google_storage_project_service_account" "this" {
}

resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members       = [
     "serviceAccount:${data.google_storage_project_service_account.this.email_address}",
  ]
}