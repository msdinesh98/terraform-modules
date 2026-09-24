resource "aws_s3_bucket" "bucket_main" {
  bucket = "mybucket_ooseven"
  force_destroy = true

}
resource "aws_s3_bucket_versioning" "version_bucket" {
  bucket = aws_s3_bucket.bucket_main.id
  versioning_configuration {
    status = "Enabled"
  }
}