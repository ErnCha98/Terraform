resource "aws_s3_bucket" "media" {
  bucket = var.bucket
}

resource "aws_s3_object" "upload_media" {
  for_each = var.media

  bucket = aws_s3_bucket.media.id
  source   = each.value
  key      = substr(each.value, 6, 23)
}

output "bucket_url" {
  value = {
    for k, v in aws_s3_object.upload_media : k => "${v.bucket}.s3.amazonaws.com/${v.key}"
  }
}