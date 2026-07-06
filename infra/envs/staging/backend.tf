terraform {
  backend "s3" {
    bucket         = "tf-state-safe-bucket"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock-dynamodb-table"
    encrypt        = true
  }
}
