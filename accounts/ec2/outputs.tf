#output "password_data" {
 # description = "List of Base-64 encoded encrypted password data for the instance"
  #value  = aws_instance.this.*.password_data
#}


#output "Administrator_Password" {
 # value = [
 #   for i in aws_instance.example : rsadecrypt(i.password_data, file("mykey.pem"))
 # ]
#}

output "key_name" {
  description = "The key pair name."
  value     = module.ec2.key_name
}
output "ec2_password" {
   value = "${rsadecrypt(module.ec2.password_data[0], file("../../../modules/secrets/upsa_cicd_dev_paris.pem"))}"
   }

output "private_ip" {
  value = module.ec2.private_ip
}
