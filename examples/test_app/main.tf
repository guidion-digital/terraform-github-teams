variable "maintainers" { default = {} }
variable "members" { default = {} }

module "soopa_team" {
  source = "../../"

  name                      = "soopas"
  description               = "We do the webs"
  privacy                   = "closed"
  create_default_maintainer = true

  maintainers = var.maintainers
  members     = var.members
}
