resource "local_file" "demo1" {
  filename = "demo01.txt"
  content = "Este es mi primer lab de terraform"
}
resource "local_file" "demo01" {
  filename = "demo01.txt"
  content = "Esta es mi lab de terraform"
  file_permission = "0644"
}