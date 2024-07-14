variable "project_id" {
  description = "The project ID to deploy resources"
  type        = string
  default     = "deep1234"
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "github_owner" {
  description = "GitHub user or organization name"
  type        = string
  default     = "datatest067"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "dummy"
}

variable "github_secret_name" {
  description = "Name of the secret in Google Secret Manager that contains the GitHub token"
  type        = string
  default     = "github-token"
}

variable "github_token_file" {
  description = "The path to the file containing the GitHub token"
  type        = string
  default     = "./github.txt"
}