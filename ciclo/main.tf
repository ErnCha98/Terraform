resource "local_file" "file" {
  filename = var.filename
  file_permission = 0777
  content = "bye.txt"

  lifecycle {
    create_before_destroy = true
}

}



variable "filename" {
  default = "byte.txt"
}