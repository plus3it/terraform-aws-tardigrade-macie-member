# terraform-aws-tardigrade-macie-member

A terraform module to create the handshake role needed by macie and then to setup the account as a member of your macie master

## Testing
You can find example implementations of this module in the tests folder. This module
requires 2 different AWS accounts to test and so the terraform aws provider definitions
are assuming that you will be using a profile with the name `member` and `master`.

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_aws.master"></a> [aws.master](#provider\_aws.master) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.master](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_macie_member"></a> [create\_macie\_member](#input\_create\_macie\_member) | Controls whether to create the Macie member | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of tags to apply to the resources | `map(string)` | `{}` | no |

## Outputs

No outputs.

<!-- END TFDOCS -->
