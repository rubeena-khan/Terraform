provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo_s3" {
  bucket = "terraform_batch1_bucket"
}

