variable "environment" {
  type        = string
  description = "Environment of the deployment"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags to add to the resource group"
  default     = {}
}

variable "prefix" {
  type        = string
  description = "Prefix for the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}
