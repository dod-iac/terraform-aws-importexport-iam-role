<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Usage

Creates an IAM role for use as a Snow Family service role.

```hcl
module "snowfamily_iam_role" {
  source = "dod-iac/snowfamily-iam-role/aws"

  name                  = format("app-%s-snowfamily-iam-role-%s", var.application, var.environment)
  s3_buckets_import     = ["*"]
  s3_buckets_export     = ["*"]
  sns_topics_publish    = ["*"]
  tags               = {
    Application = var.application
    Environment = var.environment
    Automation  = "Terraform"
  }
}
```

## Terraform Version

Terraform 0.13. Pin module version to ~> 1.0.0 . Submit pull-requests to main branch.

Terraform 0.11 and 0.12 are not supported.

## License

This project constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105.  However, because the project utilizes code licensed from contributors and other third parties, it therefore is licensed under the MIT License.  See LICENSE file for more information.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role_policy"></a> [assume\_role\_policy](#input\_assume\_role\_policy) | The assume role policy for the AWS IAM role.  If blank, allows Snow Family (fka Import/Export) to assume the role. | `string` | `""` | no |
| <a name="input_kms_keys_decrypt"></a> [kms\_keys\_decrypt](#input\_kms\_keys\_decrypt) | The ARNs of the AWS KMS keys that can be used to decrypt data.  Use ["*"] to allow all keys. | `list(string)` | `[]` | no |
| <a name="input_kms_keys_encrypt"></a> [kms\_keys\_encrypt](#input\_kms\_keys\_encrypt) | The ARNs of the AWS KMS keys that can be used to encrypt data.  Use ["*"] to allow all keys. | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the AWS IAM role. | `string` | n/a | yes |
| <a name="input_policy_description"></a> [policy\_description](#input\_policy\_description) | The description of the AWS IAM policy. Defaults to "The policy for [NAME]". | `string` | `""` | no |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | The name of the AWS IAM policy.  Defaults to "[NAME]-policy". | `string` | `""` | no |
| <a name="input_s3_buckets_export"></a> [s3\_buckets\_export](#input\_s3\_buckets\_export) | The ARNs of the AWS S3 buckets that data can be exported from.  Use ["*"] to allow all buckets. | `list(string)` | `[]` | no |
| <a name="input_s3_buckets_import"></a> [s3\_buckets\_import](#input\_s3\_buckets\_import) | The ARNs of the AWS S3 buckets that data can be imported into.  Use ["*"] to allow all buckets. | `list(string)` | `[]` | no |
| <a name="input_sns_topics_publish"></a> [sns\_topics\_publish](#input\_sns\_topics\_publish) | The ARNs of the AWS SNS topics that status updates can be published to.  Use ["*"] to allow all topics. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to the AWS IAM role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the AWS IAM Role. |
| <a name="output_name"></a> [name](#output\_name) | The name of the AWS IAM Role. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
