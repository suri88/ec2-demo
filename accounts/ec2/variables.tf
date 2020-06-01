variable security_group_description {}
variable security_group_cidr_block {}
variable dynamic_ingress_description {}
variable ingress_ports {}
variable security_group_role {}
variable security_group_name {}
variable destination_cidr_block {}
#variable vpc_cidr_block  {}

variable ami {}
  
variable "region" {}

#variable "vpc_id" {}
  

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}



variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  type        = bool
  default     = false
}


variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
}

/*variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}*/
variable "security_group_id" {
  description = "A list of security group IDs to associate with"
  #type        = list(string)
  default     = null
}
/*variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = ""
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  type        = bool
  default     = null
}*/
/*variable "private_ip" {
  description = "Private IP address to associate with the instance in a VPC"
  default     = ""
}

/*
variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  type        = list(map(string))
  default     = []
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  type        = list(map(string))
  default     = []
}*/

#variable "get_password_data" {
 # description = "If true, wait for password data to become available and retrieve it."
  #type        = bool
  #default   = true
#}
