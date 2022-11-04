
variable "region" {
  description = "AWS region"
  type        = string
}

variable "account_number" {
  description = "AWS account numver"
  type        = number
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

variable "build" {
  description = "Build"
  type        = any
}
