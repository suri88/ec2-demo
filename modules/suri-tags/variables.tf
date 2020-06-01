variable suri_aws_default_tags {
  type        = map(string)
  description = "Default tags to be applied to all resources created in Shared Services"
  default = {
    BusinessOwner       = "suria"
    BusinessUnit        = "dev"
    CostCentre          = "Applicable"
    DataCentre          = "india"
    Email               = "suri.com"
    Project             = "ind"
    ProvisioningTool    = "Terraform"
  }
}
