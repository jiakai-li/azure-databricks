variable "subscription_id" {
  type        = string
  default     = "f395fe55-48c9-4c82-a0c7-2551d7420d28"
  description = "Azure Subscription ID to deploy the workspace into"
}

variable "environment" {
  type        = string
  default     = "prod"
  description = "Environment of the deployment"
}
