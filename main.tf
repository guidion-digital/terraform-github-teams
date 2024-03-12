resource "github_team" "this" {
  name                      = var.name
  description               = var.description
  privacy                   = var.privacy
  create_default_maintainer = var.create_default_maintainer
}

resource "github_team_members" "these" {
  team_id = github_team.this.id

  dynamic "members" {
    for_each = var.members

    content {
      username = members.value
      role     = "member"
    }
  }

  dynamic "members" {
    for_each = var.maintainers

    content {
      username = members.value
      role     = "maintainer"
    }
  }
}
