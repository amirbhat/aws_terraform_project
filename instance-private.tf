module "ec2_private" {
  depends_on    = [module.vpc]
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "2.17.0"
  name          = "${var.Environment}-vm"
  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/app1.sh")
  key_name      = var.instance_keypair
  #subnet_id = module.vpc.private_subnets[0] # Single Instance
  vpc_security_group_ids = [module.security-group-private.security_group_id]
  instance_count         = 2
  subnet_ids = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1],
  ]
  tags = local.common_tags
}