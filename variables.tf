variable "assume_role_policy" {
  type        = string
  description = "The assume role policy for the AWS IAM role.  If blank, allows Snow Family (fka Import/Export) to assume the role."
  default     = ""
}

variable "name" {
  type        = string
  description = "The name of the AWS IAM role."
}

variable "policy_description" {
  type        = string
  description = "The description of the AWS IAM policy. Defaults to \"The policy for [NAME]\"."
  default     = ""
}

variable "policy_name" {
  type        = string
  description = "The name of the AWS IAM policy.  Defaults to \"[NAME]-policy\"."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the AWS IAM role."
  default     = {}
}

variable "s3_buckets_export" {
  type        = list(string)
  description = "The ARNs of the AWS S3 buckets that data can be exported from.  Use [\"*\"] to allow all buckets."
  default     = []
}

variable "s3_buckets_import" {
  type        = list(string)
  description = "The ARNs of the AWS S3 buckets that data can be imported into.  Use [\"*\"] to allow all buckets."
  default     = []
}

variable "sns_topics_publish" {
  type        = list(string)
  description = "The ARNs of the AWS SNS topics that status updates can be published to.  Use [\"*\"] to allow all topics."
  default     = []
}
