// Configure the Google Cloud Provider
provider "google" {
    credentials = "${file("terraformvmproject-4ea683f68220.json")}"
    project = "terraformvmproject"
    region = "us-west1"
}
// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
    byte_length = 8
}

// A single Google Cloud Engine instance
resource "google_compute_instance" "default" {
    name = "marty-vm-${random_id.instance_id.hex}"
    machine_type = "f1-micro"
    zone = "us-west1-a"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
        }
    }
    // Make sure flask is installed on all new instances for later steps
    metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; pip install flask"

    network_interface {
        network = "default"

        access_config {
            // Include this section to give the VM an external ip address
        }
    }
}