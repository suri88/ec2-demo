variable upsa_aws_ntw_env_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in the AWS UPSA environment"
  default = {
    BusinessOwner       = "Yomi Ogunyinka"
    BusinessUnit        = "dev"
    CostCentre          = "Not Applicable"
    DataCentre          = "Paris"
    Email               = "yomi.ogunyinka@wipro.com"
    Project             = "IaC"
    ProvisioningTool    = "Terraform"
  }
}
