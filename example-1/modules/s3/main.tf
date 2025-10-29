# ------------------------------
# S3 Bucket for Demo
# ------------------------------

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket        = "terraform-demo-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name = "terraform-demo-bucket"
  }
}

# Block all public access (Best Practice)
resource "aws_s3_bucket_public_access_block" "demo_block" {
  bucket = aws_s3_bucket.demo_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

