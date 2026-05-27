module "ec2" {
  source = "../../modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  env           = var.env
}

module "rds" {
  source = "../../modules/rds"

  env                = var.env
  allocated_storage  = var.allocated_storage
  engine             = var.engine
  engine_version     = var.engine_version
  instance_class     = var.instance_class
  db_username        = var.db_username
  db_password        = var.db_password
  db_name            = var.db_name
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
}
module "ecs" {
  source = "../../modules/ecs"

  env                = var.env
  aws_region         = var.aws_region
  cpu                = var.cpu
  memory             = var.memory
  container_image    = var.container_image
  container_port     = var.container_port
  desired_count      = var.desired_count
  execution_role_arn = var.execution_role_arn
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
}
