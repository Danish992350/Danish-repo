provider "google" {
  credentials = file("tf_auth.json")
  project     = "terraform-gcp-389807"
  region      = "us-east1"
  zone        = "us-east1-b"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}
