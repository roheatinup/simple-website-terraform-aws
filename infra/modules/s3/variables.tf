variable "bucket_name" {
  description = "The name of the S3 bucket to create."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the S3 bucket."
  type        = map(string)
  default     = {}
}

variable "cloudfront_distribution_arn" {
  description = "The ARN of the CloudFront distribution to associate with the S3 bucket."
  type        = string
}