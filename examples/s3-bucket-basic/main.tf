module "s3_bucket" {
  source = "../../modules/s3-bucket"

  bucket_name = "example-bucket"
  versioning  = true

  tags = {
    Project = "example"
  }
}
