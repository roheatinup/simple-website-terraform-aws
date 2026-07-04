#domain name
variable "domain_name" {
  description = "The domain name for the Route53 zone."
  type        = string
}

variable "subdomain" {
  description = "The subdomain for the Route53 record. Leave empty for root domain."
  type        = string
  default     = ""
}

variable "cloudfront_domain_name" {
  description = "The domain name of the CloudFront distribution to point the Route53 record to."
  type        = string
}