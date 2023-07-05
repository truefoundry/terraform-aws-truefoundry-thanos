locals {
  artifact_bucket_unique_name = "${var.cluster_name}-${var.thanos_name}"
  tags = merge(
    {
      "terraform-module" = "cluster-app-thanos"
      "terraform"        = "true"
      "cluster-name"     = var.cluster_name
    },
    var.tags
  )
}