terraform {
  backend "s3" {
    bucket         = "terraform-state-keerthik"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform_lock"
    encrypt        = true
  }
}
