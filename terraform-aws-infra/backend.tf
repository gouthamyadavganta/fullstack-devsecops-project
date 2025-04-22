terraform {
  backend "s3" {
    bucket         = "terraform-state-gautam-project"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-lock-gautam-project"
    encrypt        = true
  }
}
