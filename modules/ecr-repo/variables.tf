variable "name" {
  type        = string
  description = "Name of the ECR repository"
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "Whether image tags can be overwritten (MUTABLE or IMMUTABLE)"
}

variable "scan_on_push" {
  type        = bool
  default     = true
  description = "Enable vulnerability scanning on push"
}

variable "encryption_type" {
  type        = string
  default     = "AES256"
  description = "Encryption type for ECR (AES256 or KMS)"
}

variable "kms_key" {
  type        = string
  default     = null
  description = "KMS key ARN if encryption_type = KMS"
}

variable "enable_lifecycle_policy" {
  type        = bool
  default     = true
  description = "Enable lifecycle policy for cleaning up old images"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the repository"
}
