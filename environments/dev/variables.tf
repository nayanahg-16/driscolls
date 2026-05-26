variable "ami_id" {}
variable "instance_type" {}
variable "env" {}

variable "allocated_storage" {}
variable "engine" {}

variable "engine_version" {}

variable "instance_class" {}

variable "db_username" {}

variable "db_password" {
  sensitive = true
}

variable "db_name" {}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}
