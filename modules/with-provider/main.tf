provider "aws" {
  region = "us-east-1"
}

resource "random_string" "string" {
  length = 10
}
