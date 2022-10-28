
resource "aws_codecommit_repository" "repository" {
  repository_name = var.repository.name
  description     = var.repository.description
}
