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


module "artifact_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.7.0"

  bucket        = var.artifact_bucket_enable_override ? var.artifact_bucket_override_name : null
  bucket_prefix = var.artifact_bucket_enable_override ? null : local.artifact_bucket_unique_name
  force_destroy = var.artifact_bucket_force_destroy

  tags = merge(
    {
      Name = local.artifact_bucket_unique_name
    },
    local.tags
  )


  # Bucket policies
  attach_policy                         = true
  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true

  # S3 bucket-level Public Access Block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  acl = "private" # "acl" conflicts with "grant" and "owner"

  versioning = {
    status     = true
    mfa_delete = false
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = var.artifact_bucket_encryption_key_arn
        sse_algorithm     = var.artifact_bucket_encryption_algorithm
      }
    }
  }

  intelligent_tiering = {
    general = {
      status = "Enabled"
      tiering = {
        ARCHIVE_ACCESS = {
          days = 90
        }
      }
    }
  }
}
