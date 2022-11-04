
resource "aws_codecommit_repository" "repository" {
  repository_name = var.repository.name
  description     = var.repository.description

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_s3_bucket" "build_artifact" {
  bucket        = var.build.artifacts.s3
  force_destroy = true

  tags = {
    Name        = var.build.artifacts.s3
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_iam_role" "iam_role" {
  name = var.build.iam_role.name
  assume_role_policy = file("role.json")
}

resource "aws_iam_role_policy" "iam_role_policy" {
  role   = aws_iam_role.iam_role.name
  policy = templatefile("role_policy.json", {account_number = var.account_number, region = var.region, repo = var.repository.name})
}

resource "aws_codebuild_project" "build_project" {
  name         = var.build.name
  description  = var.build.description
  service_role = aws_iam_role.iam_role.arn

  source {
    type     = "CODECOMMIT"
    location = aws_codecommit_repository.repository.clone_url_http
  }

  artifacts {
    type     = "S3"
    location = aws_s3_bucket.build_artifact.id
  }

  environment {
    type         = "LINUX_CONTAINER"
    compute_type = "BUILD_GENERAL1_SMALL"
    image        = "aws/codebuild/standard:4.0"
  }
}
