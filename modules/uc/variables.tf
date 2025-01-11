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
