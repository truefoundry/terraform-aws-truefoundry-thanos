variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "thanos_name" {
  description = "Name of thanos deployment"
  type        = string
  default     = "thanos"
}

variable "k8s_service_account_name" {
  description = "The k8s thanos service account name"
  type        = string
}

variable "k8s_service_account_namespace" {
  description = "The k8s thanos namespace"
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "The oidc url of the eks cluster"
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "AWS Tags common to all the resources created"
}

variable "artifact_bucket_encryption_algorithm" {
  description = "Algorithm used for encrypting the default bucket."
  type        = string
  default     = "AES256"
}
variable "artifact_bucket_force_destroy" {
  description = "Force destroy for the default bucket."
  type        = bool
}

variable "artifact_bucket_encryption_key_arn" {
  description = "ARN of the key used to encrypt the bucket. Only needed if you set aws:kms as encryption algorithm."
  type        = string
  default     = null
}

variable "artifact_bucket_enable_override" {
  description = "Enable override for s3 bucket name. You must pass artifact_bucket_override_name"
  type        = bool
  default     = false
}
variable "artifact_bucket_override_name" {
  description = "Override name for s3 bucket. artifact_bucket_enable_override must be set true"
  type        = string
  default     = ""
}

variable "account_name" {
  description = "AWS Account Name"
  type        = string
}