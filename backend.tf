terraform {
  backend "s3" {
    bucket = "sprint5"
    key    = "QA/ASG.tfstate"
    region = "us-east-1"
  }
}
