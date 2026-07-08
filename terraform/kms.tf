#############################################
# KMS Customer Managed Key
#############################################

resource "aws_kms_key" "healthcare" {

  description = "KMS key for HIPAA healthcare platform encryption"

  enable_key_rotation = true

  deletion_window_in_days = 30


  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "Enable IAM User Permissions"

        Effect = "Allow"

        Principal = {

          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"

        }

        Action = "kms:*"

        Resource = "*"

      }

    ]

  })


  tags = {

    Name = "${var.project_name}-kms-key"

    Purpose = "HIPAA Data Encryption"

  }

}


#############################################
# KMS Alias
#############################################

resource "aws_kms_alias" "healthcare" {

  name = "alias/${var.project_name}-key"

  target_key_id = aws_kms_key.healthcare.key_id

}


#############################################
# Current AWS Account Information
#############################################

data "aws_caller_identity" "current" {}