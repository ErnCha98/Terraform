# data "google_compute_image" "image" {
#   family = "ubuntu-2004-lts"
# }

# resource "google_compute_disk" "disk" {
#   name = "disk"
#   image = data.google_compute_image.image.image
#   size = 10
#   type = "e2-small"
#   zone = "us-east1-b"

# }

# resource "google_compute_address" "static-internal" {
#   name = "compute-static"
#   subnetwork = module.network.subnet_id
#   address_type = "INTERNAL"
#   address = "10.0.0.100"
#   region = "us-east1"
# }

# resource "google_compute_address" "static-externa" {
#   name = "compute-static"
#   region = "us-east1"
# }


# resource "google_compute_instance" "instance01" {
#   name = "instance01"
#   machine_type = "e2-small"
#   zone = "us-east1-b"
#   tags = ["new"]
#   labels = {
#     env="dev"
#     team="devops"
#   }

#   boot_disk{
#     source = google_compute_disk.disk.id
#     auto_delete = false
#   }

#   network_interface{
#     network = module.network.network_id
#     subnetwork = module.network.subnet_id
#     network_ip = google_compute_address.static-internal.address
    

#     access_config {
#         nat_ip = google_compute_address.static-external.address
#     }
#   }


#     connection {
#         type = "ssh"
#         host = self.network_interface.0.access_config.0.nat_ip
#         user = ""
#         private_key = tls_private_key.key.private_key_pem
  
#   }

#   provisioner "file"{
#     source "./hello.txt"
#     destination ="/home/.../hello.txt"
#   }

#   }
# resource "tls_private_key" "key"{
#     algorithm = "RSA"
#     rsa_bits = 2048
# }

# resource "local_file" "private"{
#     filename= "./key"
#     sensitive_content = tls_private_key.key.private_key_pem
#     file_permission = "0400"
# }