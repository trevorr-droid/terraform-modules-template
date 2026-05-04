output "cluster_name" {
  description = "EKS cluster name."
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint."
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  description = "EKS cluster CA certificate."
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

output "cluster_arn" {
  description = "EKS cluster ARN."
  value       = aws_eks_cluster.this.arn
}

output "node_group_role_arns" {
  description = "Map of node group IAM role ARNs."
  value       =  try({ for k, v in aws_iam_role.node_group : k => v.arn }, {})
}

output "oidc_provider_arn" {
  value       = aws_iam_openid_connect_provider.this.arn
  description = "ARN of the OIDC provider for IRSA"
}

output "oidc_provider_url" {
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
  description = "OIDC issuer URL for IRSA"
}
