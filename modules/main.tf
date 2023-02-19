locals {  
  filename = "test.txt"
}

module "file-module" {
  source = "./file-module"
  in-filename = local.filename
   
}

module "file-module-dos" {
  source = "./file-module"
  in-filename = "dos.txt"
}

module "file-module-tres" {
  source = "./file-module"
  in-filename = "tres.txt"
}
