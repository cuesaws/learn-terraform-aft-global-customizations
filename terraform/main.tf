module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}
module "security-groups" {
  source = "./modules/security-groups"
}
module "ec2" {
  source = "./modules/ec2"
  key_name = module.security-groups.key_name
}
