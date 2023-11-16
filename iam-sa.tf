# From https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/examples/irsa/irsa.tf

data "aws_eks_cluster" "cluster" {
  name = var.cluster_name
}
data "aws_iam_policy_document" "artifact_bucket_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
    ]
    resources = [
      "arn:aws:s3:::${local.artifact_bucket_unique_name}*",
      "arn:aws:s3:::${local.artifact_bucket_unique_name}*/*",
    ]
  }
}

resource "aws_iam_policy" "thanos_bucket_policy" {
  name_prefix = "${local.artifact_bucket_unique_name}-access-to-bucket"
  description = "thanos buckets policy for cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.artifact_bucket_policy.json
  tags        = local.tags
}

module "iam_assumable_role_admin" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.27.0"

  create_role  = true
  role_name    = "${var.cluster_name}-thanos-deps"
  provider_url = replace(var.cluster_oidc_issuer_url, "https://", "")
  oidc_fully_qualified_subjects = [
    "system:serviceaccount:${var.k8s_service_account_namespace}:${var.k8s_service_account_name}"
  ]

  role_policy_arns = [
    aws_iam_policy.thanos_bucket_policy.arn
  ]
  tags = local.tags
}