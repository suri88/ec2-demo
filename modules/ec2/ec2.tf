locals {
  is_t_instance_type = replace(var.instance_type, "/^t(2|3|3a){1}\\..*$/", "1") == "1" ? true : false
}

resource "aws_instance" "this" {
  #name             = var.name
  count            = var.instance_count
  ami              = var.ami
  instance_type    = var.instance_type
  subnet_id        = var.subnet_id
  key_name         = var.key_name
  get_password_data      = var.get_password_data
  vpc_security_group_ids = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  #associate_public_ip_address = false
  private_ip                  =  var.private_ip
  ebs_optimized = var.ebs_optimized

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = lookup(ebs_block_device.value, "delete_on_termination", null)
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      kms_key_id            = lookup(ebs_block_device.value, "kms_key_id", null)
      snapshot_id           = lookup(ebs_block_device.value, "snapshot_id", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }
}
