provider "aws" {
  region = var.region
}

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
variable "vpc_id" {}

data "aws_vpc" "example" {
  id = var.vpc_id
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.example.id
}

/*filter {
name   = "tag:Role"
values = [var.subnet_type]
  }
}*/


module suri-tags {
  source = "../../modules/suri-tags"
}

module "security-groups" {
  source = "../../modules/security-groups"
  vpc_id                       = data.aws_vpc.example.id
  security_group_name          = var.security_group_name
  ingress_ports                = var.ingress_ports
  security_group_description   = var.security_group_description
  security_group_cidr_block    = var.security_group_cidr_block
  dynamic_ingress_description  = var.dynamic_ingress_description
  destination_cidr_block       = var.destination_cidr_block
  security_group_role          = var.security_group_role
 #vpc_cidr_block               = var.vpc_cidr_block 
  suri_account_tags            = module.suri-tags.suri_aws_default_tags
}

module "ec2" {
  source = "../../modules/ec2"
  instance_count          = 1
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = "var.key_name"
  subnet_id               = tolist(data.aws_subnet_ids.all.ids)[0]
  vpc_security_group_ids      = [module.security-groups.id]
  associate_public_ip_address = false
  get_password_data     = var.get_password_data 
  root_block_device = [
    {
      volume_type = "gp2"
      volume_size = 30
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp2"
      volume_size = 30
      encrypted   = true
    }
  ]

}


