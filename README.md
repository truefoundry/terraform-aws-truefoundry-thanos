# terraform-aws-truefoundry-thanos
Truefoundry AWS Thanos Module

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_artifact_bucket"></a> [artifact\_bucket](#module\_artifact\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.14.0 |
| <a name="module_iam_assumable_role_admin"></a> [iam\_assumable\_role\_admin](#module\_iam\_assumable\_role\_admin) | terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc | 5.27.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.thanos_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_policy_document.artifact_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | AWS Account Name | `string` | n/a | yes |
| <a name="input_artifact_bucket_enable_override"></a> [artifact\_bucket\_enable\_override](#input\_artifact\_bucket\_enable\_override) | Enable override for s3 bucket name. You must pass artifact\_bucket\_override\_name | `bool` | `false` | no |
| <a name="input_artifact_bucket_encryption_algorithm"></a> [artifact\_bucket\_encryption\_algorithm](#input\_artifact\_bucket\_encryption\_algorithm) | Algorithm used for encrypting the default bucket. | `string` | `"AES256"` | no |
| <a name="input_artifact_bucket_encryption_key_arn"></a> [artifact\_bucket\_encryption\_key\_arn](#input\_artifact\_bucket\_encryption\_key\_arn) | ARN of the key used to encrypt the bucket. Only needed if you set aws:kms as encryption algorithm. | `string` | `null` | no |
| <a name="input_artifact_bucket_force_destroy"></a> [artifact\_bucket\_force\_destroy](#input\_artifact\_bucket\_force\_destroy) | Force destroy for the default bucket. | `bool` | n/a | yes |
| <a name="input_artifact_bucket_override_name"></a> [artifact\_bucket\_override\_name](#input\_artifact\_bucket\_override\_name) | Override name for s3 bucket. artifact\_bucket\_enable\_override must be set true | `string` | `""` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | EKS Cluster Name | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | The oidc url of the eks cluster | `string` | n/a | yes |
| <a name="input_k8s_service_account_name"></a> [k8s\_service\_account\_name](#input\_k8s\_service\_account\_name) | The k8s thanos service account name | `string` | n/a | yes |
| <a name="input_k8s_service_account_namespace"></a> [k8s\_service\_account\_namespace](#input\_k8s\_service\_account\_namespace) | The k8s thanos namespace | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | AWS Tags common to all the resources created | `map(string)` | `{}` | no |
| <a name="input_thanos_name"></a> [thanos\_name](#input\_thanos\_name) | Name of thanos deployment | `string` | `"thanos"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_thanos_bucket_name"></a> [thanos\_bucket\_name](#output\_thanos\_bucket\_name) | n/a |
| <a name="output_thanos_iam_role_arn"></a> [thanos\_iam\_role\_arn](#output\_thanos\_iam\_role\_arn) | n/a |
<!-- END_TF_DOCS -->