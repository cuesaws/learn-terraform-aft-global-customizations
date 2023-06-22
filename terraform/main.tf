module "vpc" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
}
module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.subnet.subnet_id
  vpc_id = module.vpc.vpc_id
}
