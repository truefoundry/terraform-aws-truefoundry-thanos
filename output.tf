output "thanos_bucket_name" {
  value = module.artifact_bucket.s3_bucket_id
}

output "thanos_iam_role_arn" {
  value = module.iam_assumable_role_admin.iam_role_arn
}
