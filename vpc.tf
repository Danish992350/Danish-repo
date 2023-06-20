resource "google_compute_network" "custom-vpc-tf" {
  project                 = "terraform-gcp-389807"
  name                    = "vpc-network"
  auto_create_subnetworks = false
}



resource "google_compute_subnetwork" "us-east" {
  name          = "us-east1"
  ip_cidr_range = "10.1.0.0/24"
  region        = "us-east1"
  network       = google_compute_network.custom-vpc-tf.id
}


output "custom" {
  value = google_compute_network.custom-vpc-tf.id
}
