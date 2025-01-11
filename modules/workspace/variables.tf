variable "environment" {
  type        = string
  description = "Environment of the deployment"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags to add to resources"
  default     = {}
}

variable "prefix" {
  type        = string
  default     = "data-platform"
  description = "Prefix for resources to be created"
}

variable "location" {
  type        = string
  default     = "australiasoutheast"
  description = "Location of resource group to create"
}

variable "vnet_cidr" {
  type        = string
  default     = "10.179.0.0/16"
  description = "Network range for the created vnet"
}
