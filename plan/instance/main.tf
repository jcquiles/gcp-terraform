module "vpc" {
  source = "../../modules/vpc" 
  project               = "lido-360921"
  vpc_name              = "dirk-vpc"
  public_subnet_1       = "10.26.2.0/24"
  private_subnet_1      = "10.26.1.0/24"
  public_subnet_2       = "10.26.4.0/24"
  private_subnet_2      = "10.26.3.0/24"
}

module "compute1" {
  source                = "../../modules/compute1"
  compute_name          = "dirk1"
  compute_image         = "debian-cloud/debian-10"
  compute_size          = "e2-small"
  region_name           = "us-central1" 
  project               = "lido-360921"
  public_subnet_1       = "10.26.2.0/24"
  private_subnet_1      = "10.26.1.0/24"
  public_subnetwork     = "dirk1-public-subnet"
  private_subnetwork    = "dirk1-private-subnet"
  vpc_name              = "dirk-vpc"
}