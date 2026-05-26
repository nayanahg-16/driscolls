resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "${var.env}-rds-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "${var.env}-rds-subnet-group"
  }
}

resource "aws_db_instance" "rds" {
  identifier             = "${var.env}-rds"
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.db_username
  password               = var.db_password
  db_name                = var.db_name
  skip_final_snapshot    = true
  publicly_accessible    = false
  vpc_security_group_ids = var.security_group_ids
  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name

  tags = {
    Name = "${var.env}-rds"
  }
}
