terraform {
  backend "s3" {
    bucket = "terraform-roboshop-statefiles"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}