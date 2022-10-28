
variable "region" {
    description = "AWS region"
    type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "repository" {
  description = "Repository"
  type        = map
}
