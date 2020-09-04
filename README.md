# tf-aws-static-website
Terraform module for a static website

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| aws | ~> 3.3.0 |
| aws | ~> 3.3.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 3.3.0 ~> 3.3.0 |
| aws.us-east-1 | ~> 3.3.0 ~> 3.3.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | AWS region name (us-east-1, eu-east-1...) | `string` | n/a | yes |
| default\_root\_object | Default root object e.g: index.html | `string` | `"index.html"` | no |
| domain\_name | Domain name | `string` | n/a | yes |
| environment | Name of the environment | `string` | n/a | yes |
| hosted\_zone\_id | Route 53 hosted zone id | `string` | n/a | yes |
| project\_name | Name of the project | `string` | n/a | yes |
| stack | Stack name, name of the project, customer name... | `string` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
