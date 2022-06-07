locals {
  owners      = var.department
  Environment = var.Environment
  name        = "${var.department}-${var.Environment}"
  common_tags = {
    owners      = local.owners
    Environment = local.Environment
  }
}