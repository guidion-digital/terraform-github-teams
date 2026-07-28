variable "maintainers" { default = {} }
variable "members" { default = {} }

module "soopa_team" {
  source = "../../"

  name                      = "soopas"
  description               = "We do the webs"
  privacy                   = "closed"
  maintainers = var.maintainers
  members     = var.members
}
