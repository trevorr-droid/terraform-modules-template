variable "role_name" {
  type        = string
  description = "Name of the IAM role to create for GitHub Actions"
}

variable "github_sub" {
  type        = string
  description = "GitHub OIDC 'sub' claim to allow (e.g. repo:owner/repo:ref:refs/heads/main)"
}

variable "inline_policy_json" {
  type        = string
  description = "JSON IAM policy to attach to the role"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to all resources"
}
