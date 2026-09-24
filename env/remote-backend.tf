terraform {
  backend "s3" {
    bucket = "value"
    key = "value"
    encrypt = true
    use_lockfile = true
    region = "us-east-2"
  }
}