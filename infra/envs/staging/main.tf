module "s3" {
  source = "../../modules/s3"

  bucket_name = "${var.project_name}-${var.environment}-${data.aws_caller_identity.current.account_id}"
  cloudfront_distribution_arn = module.cloudfront.arn

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

module "cloudfront" {
  source = "../../modules/cloudfront"

  project_name                   = var.project_name
  environment                    = var.environment
  s3_bucket_id                   = module.s3.bucket_id
  s3_bucket_regional_domain_name = module.s3.bucket_regional_domain_name
}

# Get current AWS account ID for bucket naming
data "aws_caller_identity" "current" {}
