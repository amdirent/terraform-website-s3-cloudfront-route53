################################################################################################################
## Create a Route53 ALIAS record to the Cloudfront website distribution
################################################################################################################
resource "aws_route53_record" "cdn-alias" {
  zone_id = "${var.route53_zone_id}"
  name    = "${var.domain}"
  type    = "A"

  alias {
    name                   = "${var.target}"
    zone_id                = "${var.cdn_hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cdn-alias-www" {
  zone_id = "${var.route53_zone_id}"
  name    = "www.${var.domain}"
  type    = "A"

  alias {
    name                   = "${var.domain}"
    zone_id                = "${var.route53_zone_id}"
    evaluate_target_health = false
  }
}
