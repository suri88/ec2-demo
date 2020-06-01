#################################################
# Security Group 
#################################################

variable security_group_name {}
variable security_group_description {}
variable security_group_cidr_block {}
variable dynamic_ingress_description {}
variable ingress_ports {}
variable security_group_role {}

#################################################
# Variables exported for Downstream Consumption
#################################################

variable vpc_id {}
variable destination_cidr_block {}

#################################################
#  Global Account Tags
#################################################

variable suri_account_tags {}
