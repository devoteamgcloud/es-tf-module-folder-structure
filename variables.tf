variable "parent_id" {
  description = "ID of the parent where the folders will be created (organizations/123456 or folders/123456)"
  type        = string
}

variable "folder_structure" {
  description = "Nested folder structure up to 4 levels of depth"
  type        = map(any)
}

variable "deletion_protection" {
  description = "Protection against deletion for level 3 and 4 folders"
  type        = bool
  default     = false
}