resource "time_static" "time_update" {
  
}

resource "local_file" "time" {
    filename = "time.txt"
    content = "Fecha y hora: ${time_static.time_update.id}"
}