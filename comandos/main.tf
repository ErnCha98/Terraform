resource "local_file" "key_data" {
  filename        = "/tmp/.pki/private_key.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0400"
}
resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}