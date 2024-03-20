output "team_id" {
  description = "ID of the created team"
  value       = github_team.this.id
}

output "team_name" {
  description = "Name of the created team"
  value       = github_team.this.name
}

output "team_maintainers" {
  description = "Maintainers added to team — used for testing"
  value       = [for these_members in github_team_members.these.members : these_members.username if these_members.role == "maintainer"]
}

output "team_members" {
  description = "Members added to team — used for testing"
  value       = [for these_members in github_team_members.these.members : these_members.username if these_members.role == "member"]
}

output "all_team_members" {
  description = "All members — used for testing"
  value       = github_team_members.these.members
}
