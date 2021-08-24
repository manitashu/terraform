module "sg" {
  source = "./sg"
}

module "ec2" {
  source = "./ec2"
  SG_ID = module.sg.SG_ID
}

