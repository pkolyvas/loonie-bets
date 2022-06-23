
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"

  name = "loonie-bets-vpc"
  cidr = "10.231.0.0/16"

  azs             = ["ca-central-1a", "ca-central-1b"]
  private_subnets = ["10.231.1.0/24", "10.231.2.0/24"]
  public_subnets  = ["10.231.11.0/24", "10.231.22.0/24"]

  enable_nat_gateway = false
  tags = {
    Terraform   = "true"
    Environment = "playground"
  }
}