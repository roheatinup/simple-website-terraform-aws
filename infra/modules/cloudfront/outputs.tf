output "domain_name" {
  value       = aws_cloudfront_distribution.site.domain_name
  description = "The domain name of the CloudFront distribution."
}

output "distribution_id" {
  value       = aws_cloudfront_distribution.site.id
  description = "The ID of the CloudFront distribution."
}

output "hosted_zone_id" {
  value       = aws_cloudfront_distribution.site.hosted_zone_id
  description = "The hosted zone ID of the CloudFront distribution."
}

output "arn" {
  value       = aws_cloudfront_distribution.site.arn
  description = "The ARN of the CloudFront distribution."
}