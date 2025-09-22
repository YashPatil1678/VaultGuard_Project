terraform {
  backend "s3" {
    bucket = "vault-guard-remote-backend"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
