module "gke" {
  source           = "../../modules/gke"
  project_id       = "argocd-373318"
  region           = "us-west1"
  cluster_name     = "gke" 
  ip_cidr_range    = "10.138.0.0/20"
  bucket_name      = "gke-autopilot-bucket-2022"
  bucket_location  = "us"
  storage_class    = "MULTI_REGIONAL"
}