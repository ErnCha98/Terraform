resource "local_sensitive_file" "tempfile" {
     for_each = toset(var.users)  # nos transforma una arreglo en arreglos unicos
     filename = each.value

#filename = var.users[count.index]
content = "password: password"
#count = length(var.users)

}

variable "users" {
  type    = list(string)
  default = ["user02", "user03"]
}