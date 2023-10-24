variable "profile" {
    description = "The profile used to auth to AWS"
}

variable "region" {
    description= "The region our instance will be in (i.e. us-east-1)"
}

variable "name" {
    description= "The name of the instance we are creating"
}

variable "group" {
    description= "the name of the group we will be using for Ansible purposes"
}