resource "aws_s3_bucket" "demo_bucket" {
  bucket = "terraform-98989"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.demo_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_object" "demo_file" {
  bucket      = aws_s3_bucket.demo_bucket.id
  key         = "demo_s3.png"
  source      = "../assets/electricidad.jpg"
  content_type = "image/jpeg"

  acl = "public-read"
}
