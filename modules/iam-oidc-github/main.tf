###############################################
# GitHub OIDC Provider
###############################################

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = [
    "sts.amazonaws.com"
  ]

  # GitHub's published thumbprint
  thumbprint_list = [
    "6938fd4d98bab03faadb97b34396831e3780aea1"
  ]

  tags = var.tags
}

###############################################
# Trust Policy for GitHub Actions
###############################################

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github.arn]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    # Restrict to specific repo + branch
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = [var.github_sub]
    }
  }
}

###############################################
# IAM Role for GitHub Actions
###############################################

resource "aws_iam_role" "github_actions" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags
}

###############################################
# Inline Policy (user-supplied)
###############################################

resource "aws_iam_role_policy" "inline" {
  name   = "${var.role_name}-policy"
  role   = aws_iam_role.github_actions.id
  policy = var.inline_policy_json
}
