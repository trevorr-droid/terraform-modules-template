module "github_oidc_role" {
  source = "../../modules/iam-oidc-github"

  role_name  = "github-actions-ecr-push"

  # Restrict to your repo + branch
  github_sub = "repo:trevorr-droid/terraform-modules-template:ref:refs/heads/main"

  tags = {
    Project = "ci-oidc-ecr-demo"
  }

  # Least privilege example for pushing to ECR
  inline_policy_json = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ecr:GetAuthorizationToken"]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
        Resource = "*"
      }
    ]
  })
}
