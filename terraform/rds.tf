#############################################
# RDS Subnet Group
#############################################

resource "aws_db_subnet_group" "healthcare" {

  name = "${var.project_name}-db-subnet-group"

  subnet_ids = [

    aws_subnet.private_a.id,
    aws_subnet.private_b.id

  ]

  tags = {

    Name = "${var.project_name}-db-subnet-group"

  }

}

#############################################
# PostgreSQL Database
#############################################

resource "aws_db_instance" "healthcare" {

  identifier = "${var.project_name}-database"


  engine = "postgres"

  engine_version = "16"


  instance_class = "db.t3.micro"


  allocated_storage = 20


  db_name = "healthcare"


  username = "healthcare_admin"


  password = "ChangeMeSecurePassword123!"


  db_subnet_group_name = aws_db_subnet_group.healthcare.name


  vpc_security_group_ids = [

    aws_security_group.rds.id

  ]


  storage_encrypted = true


  kms_key_id = aws_kms_key.healthcare.arn


  publicly_accessible = false


  backup_retention_period = 7


  skip_final_snapshot = true


  deletion_protection = false


  tags = {

    Name = "${var.project_name}-postgres"

    Data = "Healthcare Patient Database"

  }

}
