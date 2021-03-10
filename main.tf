locals {
  shared_tags = map(
    "name", "${var.teamid}-${var.prjid}",
    "team", var.teamid,
    "project", var.prjid
  )
}
