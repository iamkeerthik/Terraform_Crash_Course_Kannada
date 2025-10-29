module "vpc" {
    source = "./modules/vpc"
    vpc_name = var.vpc_name
    cidr_block = var.cidr_block
    pvt_cidr = var.pvt_cidr
    pub_cidr = var.pub_cidr
}



module "ec2" {
    source = "./modules/ec2"
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_id = module.vpc.vpc_id
    aws_pub_sub = module.vpc.public_subnet_ids[0]
    aws_pvt_sub = module.vpc.private_subnet_ids[0]
    ec2_profile = module.iam.ec2_profile
     depends_on = [ module.iam ]
}

module "s3" {
  source = "./modules/s3"
   depends_on = [ module.ec2 ]
}


module "iam" {
  source = "./modules/iam"

  depends_on = [ module.vpc ]
}

module "s3-2c" {
  source = "./modules/s3"
   depends_on = [ module.ec2 ]
}