# 1. Bucket
resource "aws_s3_bucket" "website_bucket" {
  bucket = var.bucket_name
  tags = merge(
    var.tags,
    {
      Name = var.bucket_name
    },
  )
}

#2. Block public access (security)
resource "aws_s3_bucket_public_access_block" "website_bucket_block_public_access" {
  bucket = aws_s3_bucket.website_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#3. GenerateBucket policy for Cloudfront OAC
resource "aws_s3_bucket_policy" "allow_cloudfront" {
  bucket = aws_s3_bucket.website_bucket.id
  policy = data.aws_iam_policy_document.allow_cloudfront.json
}

#4. Applying the generated policy to the bucket
data "aws_iam_policy_document" "allow_cloudfront" {
  statement {
    sid      = "AllowCloudFrontServicePrincipal"
    effect   = "Allow"
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.website_bucket.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [var.cloudfront_distribution_arn]
    }
  }
}