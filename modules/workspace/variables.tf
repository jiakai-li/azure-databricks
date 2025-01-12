variable "adb_rg" {
  type = object({
    id       = string
    name     = string
    location = string
  })
}

variable "environment" {
  type        = string
  description = "Environment of the workspace deployment"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags to add to resources"
  default     = {}
}

variable "prefix" {
  type        = string
  description = "Prefix for resources to be created"
}

variable "metastore_id" {
  type = string
  description = "Metastore the workspace associates with"
}

variable "vnet_cidr" {
  type        = string
  default     = "10.179.0.0/16"
  description = "Network range for the created vnet"
}
