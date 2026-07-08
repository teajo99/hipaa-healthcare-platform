#############################################
# Database Credentials Secret
#############################################

resource "aws_secretsmanager_secret" "database" {

  name = "${var.project_name}/database/credentials"

  description = "Database credentials for healthcare application"

  kms_key_id = aws_kms_key.healthcare.arn


  tags = {

    Name = "${var.project_name}-database-secret"

    Purpose = "RDS Credentials"

  }

}


#############################################
# Secret Value
#############################################

resource "aws_secretsmanager_secret_version" "database" {

  secret_id = aws_secretsmanager_secret.database.id


  secret_string = jsonencode({

    username = "healthcare_admin"

    password = "ChangeMeSecurePassword123!"

    engine = "postgres"

  })

}