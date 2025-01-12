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

variable "prefix" {
  type        = string
  default     = "data-platform"
  description = "Prefix for the resource group"
}

variable "location" {
  type        = string
  default     = "australiasoutheast"
  description = "Location of the resource group"
}

variable "metastore_id" {
  type        = string
  default     = "3767c12b-6da7-426f-8d6e-fc15d3b5c400"
  description = "Metastore Id that will be associated with workspace"
}
