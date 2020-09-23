variable "location" {}

variable "subscriptiontype" {
    type    = list(string)
    default = ["dev","prod","client"]   
}

variable "prefix" {
    type = string
    default = "rpatt"
}

variable tags {
    type = map

    default = {
        Environment = "Terraform"
        User = "rpatt"
  }
}