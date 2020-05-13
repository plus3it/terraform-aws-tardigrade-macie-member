variable "create_macie_member" {
  description = "Controls whether to create the Macie member"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Map of tags to apply to the resources"
  type        = map(string)
  default     = {}
}
