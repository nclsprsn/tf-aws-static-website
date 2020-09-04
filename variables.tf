variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "environment" {
  type        = string
  description = "Name of the environment"
}

variable "aws_region" {
  type        = string
  description = "AWS region name (us-east-1, eu-east-1...)"
}

variable "stack" {
  type        = string
  description = "Stack name, name of the project, customer name..."
}

variable "default_root_object" {
  type        = string
  description = "Default root object e.g: index.html"
  default     = "index.html"
}

variable "hosted_zone_id" {
  type        = string
  description = "Route 53 hosted zone id"
}
