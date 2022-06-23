provider "aws" {
  region = "ca-central-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "east"
}

