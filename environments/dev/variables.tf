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

variable "aws_region" {}

variable "cpu" {}

variable "memory" {}

variable "container_image" {}

variable "container_port" {}

variable "desired_count" {}

variable "execution_role_arn" {}

