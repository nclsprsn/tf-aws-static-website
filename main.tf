provider "aws" {
  version = "~> 3.3.0"
}

provider "aws" {
  alias   = "us-east-1"
  version = "~> 3.3.0"
  region  = "us-east-1"
}