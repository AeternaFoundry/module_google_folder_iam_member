resource "google_folder_iam_member" "folder_iam_members" {
  for_each = var.folder_iam_members

  folder = each.value.folder
  member = each.value.member
  role   = each.value.role

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

