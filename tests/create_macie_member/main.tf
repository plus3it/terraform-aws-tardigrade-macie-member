provider "aws" {
  region  = "us-east-1"
  profile = "member"
}

provider "aws" {
  region  = "us-east-1"
  alias   = "master"
  profile = "master"
}

module "create_macie_member" {
  source = "../../"

  providers = {
    aws        = aws
    aws.master = aws.master
  }

  create_macie_member = true
}
