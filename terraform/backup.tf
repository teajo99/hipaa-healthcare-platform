#############################################
# AWS Backup Vault
#############################################

resource "aws_backup_vault" "main" {

  name = "${var.project_name}-backup-vault"

}


#############################################
# AWS Backup Plan
#############################################

resource "aws_backup_plan" "main" {

  name = "${var.project_name}-backup-plan"


  rule {

    rule_name = "daily-backup"

    target_vault_name = aws_backup_vault.main.name

    schedule = "cron(0 5 ? * * *)"


  }

}
