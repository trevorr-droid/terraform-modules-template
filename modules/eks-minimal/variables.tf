variable "name" {
  description = "EKS cluster name."
  type        = string
}

variable "region" {
  description = "AWS region for the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for worker nodes."
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "Optional list of public subnet IDs for load balancers."
  type        = list(string)
  default     = []
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "node_groups" {
  description = "Map of managed node group configurations."
  type = map(object({
    instance_types = list(string)
    desired_size   = number
    min_size       = number
    max_size       = number
    disk_size      = number
    labels         = map(string)
    taints = list(object({
      key    = string
      value  = string
      effect = string
    }))
  }))
  default = {}
}

variable "tags" {
  description = "Common tags to apply to all resources."
  type        = map(string)
  default     = {}
}
