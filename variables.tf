variable "folder_iam_members" {
  description = <<EOT
Map of folder_iam_members, attributes below
Required:
    - folder
    - member
    - role
Optional:
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    folder = string
    member = string
    role   = string
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

