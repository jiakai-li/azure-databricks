variable "subscription_id" {
  type        = string
  default     = "f395fe55-48c9-4c82-a0c7-2551d7420d28"
  description = "Azure Subscription ID to deploy the workspace into"
}

variable "account_id" {
  type        = string
  default     = "27944b26-c808-4b2e-a595-16462caec3b1"
  description = "Azure databricks account id"
}

variable "location" {
  type        = string
  default     = "australiasoutheast"
  description = "Location of the resource group and metastore"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to add to resources"
}

variable "prefix" {
  type        = string
  default     = "data-platform"
  description = "Prefix for resources to be created"
}

variable "replication_type" {
  type        = string
  default     = "LRS"
  description = "Replication type to be used for the metastore storage account"
}
