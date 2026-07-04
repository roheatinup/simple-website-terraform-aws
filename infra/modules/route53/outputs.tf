output "record_fqdn" {
  value       = aws_route53_record.alias_record.fqdn
  description = "The fully qualified domain name of the website."
}