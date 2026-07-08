# Outputs will be added as resources are created.
output "alb_security_group" {
  value = aws_security_group.alb.id
}

output "ec2_security_group" {
  value = aws_security_group.ec2.id
}

output "rds_security_group" {
  value = aws_security_group.rds.id
}

output "ec2_role_name" {

  value = aws_iam_role.ec2_role.name

}


output "ec2_instance_profile" {

  value = aws_iam_instance_profile.ec2_profile.name

}

output "kms_key_id" {

  value = aws_kms_key.healthcare.id

}


output "kms_key_arn" {

  value = aws_kms_key.healthcare.arn

}

output "patient_documents_bucket" {

  value = aws_s3_bucket.patient_documents.bucket

}

output "database_secret_arn" {

  value = aws_secretsmanager_secret.database.arn

}

output "rds_endpoint" {

  value = aws_db_instance.healthcare.endpoint

}

output "ec2_instance_id" {

  value = aws_instance.healthcare_app.id

}


output "ec2_private_ip" {

  value = aws_instance.healthcare_app.private_ip

}

output "load_balancer_dns" {

  value = aws_lb.healthcare.dns_name

}

output "cloudtrail_name" {

  value = aws_cloudtrail.main.name

}

output "config_role" {

  value = aws_iam_role.config.name

}

output "guardduty_id" {

  value = aws_guardduty_detector.main.id

}


output "sns_topic" {

  value = aws_sns_topic.alerts.arn

}

output "backup_vault" {

  value = aws_backup_vault.main.name

}
