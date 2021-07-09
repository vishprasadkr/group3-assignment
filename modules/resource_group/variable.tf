variable "rg_name" {default = "group3-assignment1-rg"}
variable "location" { default = "CanadaCentral"}

locals {
common_tags = {
    Name         = "Terraform Group Project"
    GroupMembers = "Vishnu, Ridvan, Daniel"
    ExpirationDate = "2021-07-31"
    Environment = "Lab"
  }

}