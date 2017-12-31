resource "aws_route53_zone" "denniswebb-info" {
  name = "denniswebb.info."
}

resource "aws_route53_record" "denniswebb-info-cname" {
  name = ""
  type = "A"
  zone_id = "${aws_route53_zone.denniswebb-info.zone_id}"


  alias {
    evaluate_target_health = false
    name = "${aws_s3_bucket.denniswebb-info.website_domain}"
    zone_id = "${aws_s3_bucket.denniswebb-info.hosted_zone_id}"
  }
}

resource "aws_s3_bucket" "denniswebb-info" {
  bucket = "denniswebb.info"
  acl = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}