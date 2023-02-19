# resource "aws_route53_zone" "main" {
#   name = var.domain
#   lifecycle {
#     prevent_destroy = true
#   }
# }

resource "aws_route53_record" "main" {
  zone_id = "Z02834306K6PZ2Q0GQL1" #aws_route53_zone.main.zone_id
  name    =  "app.ernes.tk"   #"${var.lab_name}.${var.domain}"
  type    = "CNAME"
  ttl     = 300
  records = [var.albWebserver.dns_name]
}