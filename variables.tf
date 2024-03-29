
variable "name" {
  description = "Team name"
  type        = string
}

variable "parent_team" {
  description = "ID or slug of the parent team, if this is a nested team"
  type        = string
  default     = null
}

variable "description" {
  description = "Description for team"
  type        = string
  default     = "🥸 Beep-boop, no description set 🥸"
}

variable "privacy" {
  description = "'secret' if only maintainers can see, or 'closed' for any organisation member to see"
  type        = string
  default     = "closed"

  validation {
    condition     = contains(["secret", "closed"], var.privacy)
    error_message = "Must be either 'secret' or 'closed'"
  }
}

variable "create_default_maintainer" {
  description = "value"
  type        = bool
  default     = true
}

variable "members" {
  description = "Map of name to username of normal members"
  type        = map(string)
  default     = {}
}

variable "maintainers" {
  description = "Map of name to username of maintainers"
  type        = map(string)
  default     = {}
}
