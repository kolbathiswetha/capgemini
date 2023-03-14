terraform {
  backend "s3" {
    bucket = "terrastate-test-vijay"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}