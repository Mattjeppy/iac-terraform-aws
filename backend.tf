terraform {
  backend "s3" {
    bucket         = "<-NAME-BUCKET-HERE->"
    key            = "config/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true

  }
}