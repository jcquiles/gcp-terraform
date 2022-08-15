terraform {
#   backend "gcs" {
#     bucket  = "tfstate-bucket-8822"
#     prefix  = "terraform/prod"
#   }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.63.0"
    }
  }
}

provider "google" {
  project     = "prod"
  region      = "us-east1"
  credentials = file("/Users/christopher.quiles/.ssh/credentials.json")
}

module "encryption_key" {
  source = "../../modules/kms"
  key_name = "terraform-gcp-accounts-state-encryption"
}

# module "bootstrap" {
#  source = "../../modules/project"
#  apis_to_enable = ["compute.googleapis.com"]
# }

module "state_file-store" {
  source      = "../..modules/bucket"
  bucket_name = "tfstate-bucket-prod"
  kms_key_id  = module.encryption_key.key.id
}