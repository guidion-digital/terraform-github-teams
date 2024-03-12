run "team_with_maintainers" {
  module {
    source = "./examples/test_app"
  }

  command = plan

  variables {
    maintainers = { "Afraz" = "afrazkhan" }
  }

  assert {
    condition     = contains(module.soopa_team.team_maintainers, "afrazkhan")
    error_message = "The test maintainer member was not present"
  }

  assert {
    condition     = !contains(module.soopa_team.team_members, "afrazkhan")
    error_message = "A member that should have been a maintainer was set as a member"
  }

  assert {
    condition     = length(module.soopa_team.team_members) == 0
    error_message = "No normal members were given in this test, but the members list was not empty"
  }
}

run "team_with_members" {
  module {
    source = "./examples/test_app"
  }

  command = plan

  variables {
    members = { "Afraz" = "afrazkhan" }
  }

  assert {
    condition     = contains(module.soopa_team.team_members, "afrazkhan")
    error_message = "The test member was not present in the normal members list"
  }

  assert {
    condition     = !contains(module.soopa_team.team_maintainers, "afrazkhan")
    error_message = "A member that should not have been a maintainer was set as so"
  }

  assert {
    condition     = length(module.soopa_team.team_maintainers) == 0
    error_message = "No maintainer members were given in this test, but the maintainer list was not empty"
  }
}

run "team_with_members_and_maintainers" {
  module {
    source = "./examples/test_app"
  }

  command = plan

  variables {
    maintainers = { "Afraz" = "afrazkhan" }
    members     = { "Robin" = "Eagleman7" }
  }

  assert {
    condition     = contains(module.soopa_team.team_maintainers, "afrazkhan")
    error_message = "The test maintainer member was not present in the maintainers list"
  }

  assert {
    condition     = !contains(module.soopa_team.team_maintainers, "Eagleman7")
    error_message = "A member that should not have been a maintainer was set as so"
  }

  assert {
    condition     = !contains(module.soopa_team.team_members, "afrazkhan")
    error_message = "A maintainer was set as a normal member"
  }
}
