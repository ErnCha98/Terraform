terraform {
  required_providers {
    aws = {
      version = "~> 4.0"
    }
  }
}

terraform {
	// ...  hace referemcia a lo que tiene lo de arriba.
  backend "s3" {
    key              = "terraform.tfstate"
    region           = "us-east-1"
    bucket           = "terralabs-remote-state-01" # Nombre del bucket creado en pasos
  }
}