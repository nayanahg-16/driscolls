variable "env" {}

variable "aws_region" {}

variable "cpu" {}

variable "memory" {}

variable "container_image" {}

variable "container_port" {}

variable "desired_count" {}

variable "execution_role_arn" {}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}
