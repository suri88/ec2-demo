region                          = "ap-south-1"

#vpc_cidr_block                  = "10.0.12.0/24"

#ami                             = "ami-0be23ddaab6554f34"
#ami                            = "ami-0fd4658f68771809b"
ami = "ami-0be7605a94be33685"
vpc_id                         = "vpc-1b4c7d73"

destination_cidr_block        = "0.0.0.0/0"

security_group_name           = "suri-sg001"

security_group_role           = "sss-ec2"

ingress_ports                 = [ 0 ]

security_group_cidr_block     = "10.0.0.0/24"

security_group_description    = "Default Security Group to Allow Local Access to the SURI Network"

dynamic_ingress_description   = "SURI-NETWORK"

instance_type                 = "t2.micro"
key_name              = "sun_key"
