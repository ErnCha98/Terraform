variable "bucket" {
  type = string
	default = "terraformlabs-test-bucket-100"
}
variable "media" {
  type = set(string)
  default = [
    "../assets/demo_func01.png",
    "../assets/demo_func02.jpg",
    "../assets/demo_func03.jpg",
  ]
}

## substr("../../assets/demo_func01.png",6,23)  Terraform console test. 

variable "name" {
  type = string
  description = "Nombre de la instancia (minimo 5 caracteres)"

  validation {
    condition     = length(var.name) > 5
    error_message = "El nombre de la instancias debe ser mayor a 5 caracteres."
  }
}


variable "size" {
  type        = string
  description = "Tamaño de la instancia: nano - micro"

  validation {
    condition     = var.size == "nano" || var.size == "micro"
    error_message = "Las instancias permitidas son: nano || micro."
  }
}


variable "nano" {
  type    = string
  default = "t3a.nano"
}

variable "micro" {
  type    = string
  default = "t3a.micro"
}

resource "aws_instance" "server" {
  ami           = "ami-033b95fb8079dc481"
  instance_type = var.size == "nano" ? var.nano : var.micro
  subnet_id = "subnet-0c35085d880b88b78"

  tags = {
    Name = var.name
  }
}

output "instance_size" {
  value = "${aws_instance.server.instance_type}"
}