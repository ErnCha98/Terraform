resource "tls_private_key" "privateKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}