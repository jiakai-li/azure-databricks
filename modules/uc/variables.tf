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
  default     = {}
  description = "Optional tags to add to resources"
}

variable "prefix" {
  type        = string
  description = "Prefix for resources to be created"
}

variable "replication_type" {
  type        = string
  default     = "LRS"
  description = "Replication type to be used for the metastore storage account"
}
