variable "project_name" {
  description = "The name of the project for tagging purposes."
  type        = string
}

variable "environment" {
  description = "The environment for tagging purposes (e.g., dev, staging, prod)."
  type        = string
}

variable "s3_bucket_id" {
  description = "The ID of the S3 bucket."
  type        = string
}

variable "s3_bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket."
  type        = string
}
