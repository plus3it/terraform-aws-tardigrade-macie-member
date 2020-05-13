provider "aws" {}

provider "aws" {
  alias = "master"
}

data "aws_caller_identity" "this" {
}

data "aws_caller_identity" "master" {
  provider = aws.master
}

# policy document for MacieHandshake role
data "aws_iam_policy_document" "this" {
  count = var.create_macie_member ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["macie.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        data.aws_caller_identity.master.account_id
      ]
    }
  }
}

# create the MacieHandshake role
resource "aws_iam_role" "this" {
  count = var.create_macie_member ? 1 : 0

  name               = "AWSMacieServiceCustomerHandshakeRole"
  description        = "Allows the master account to create service-linked roles in the member accounts"
  assume_role_policy = data.aws_iam_policy_document.this[0].json
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  count = var.create_macie_member ? 1 : 0

  role       = aws_iam_role.this[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonMacieHandshakeRole"

  # Creation of the MacieHandshake role sometimes takes a few seconds to register
  # before the parent account can assume the role, so we pause for a few seconds
  provisioner "local-exec" {
    command = "python -c 'import time; time.sleep(10)'"
  }
}

resource "aws_macie_member_account_association" "this" {
  count    = var.create_macie_member ? 1 : 0
  provider = aws.master

  member_account_id = data.aws_caller_identity.this.account_id

  depends_on = [
    aws_iam_role_policy_attachment.this
  ]
}
