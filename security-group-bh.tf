module "security-group-bastion" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "4.9.0"
  name                = "security-group-bastion"
  description         = "security group with ssh and egress allowed"
  vpc_id              = module.vpc.vpc_id
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags                = local.common_tags






}