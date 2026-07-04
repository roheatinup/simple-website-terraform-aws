terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#1. Look up the existing Route53 Zone
data "aws_route53_zone" "selected" {
  name         = var.domain_name
}

#2. Create an Alias record
resource "aws_route53_record" "alias_record" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.subdomain == "" ? var.domain_name : "${var.subdomain}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}