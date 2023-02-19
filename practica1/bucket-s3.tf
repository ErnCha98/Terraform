resource "aws_s3_bucket" "demo_bucket" {
  bucket = var.nombre
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.demo_bucket.id
  acl    = "private"
}

resource "aws_s3_object" "demo_file" {
  bucket      = aws_s3_bucket.demo_bucket.id
  key         = "demo_s3.png"
  source      = "../assets/pintura.jpg"
  content_type = "image/jpeg"

  acl = "public-read"
}

//porque no acepto aws_s3_bucket_object ?