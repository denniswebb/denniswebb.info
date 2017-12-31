terraform {
  required_version = "~> 0.11.1"

  backend "gcs" {
    bucket = "opsdata.denniswebb.info"
    prefix = "terraform/state/denniswebb.info"
  }
}

provider "google" {
  project = "denniswebb-info"
  region  = "us-central1"
}
