variable "adb_workspace" {
  type = object({
    workspace_name = string
    resource_group = string
  })
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
