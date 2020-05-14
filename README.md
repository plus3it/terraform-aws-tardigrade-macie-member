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
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| aws.master | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_macie\_member | Controls whether to create the Macie member | `bool` | `true` | no |
| tags | Map of tags to apply to the resources | `map(string)` | `{}` | no |

## Outputs

No output.

<!-- END TFDOCS -->
