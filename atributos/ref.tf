resource "local_file" "archivo2" {
  filename   = "archivo2.txt"
	content    = "archivo 2"
  depends_on = [local_file.archivo1]
}
resource "local_file" "archivo1" {
  filename = "archivo1.txt"
	content  = "archivo 1"
}