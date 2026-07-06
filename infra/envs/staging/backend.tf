// Backend is configured at CI runtime using `terraform init -backend-config`.
// The empty backend block is required so Terraform knows to use S3.

terraform {
  backend "s3" {}
}

