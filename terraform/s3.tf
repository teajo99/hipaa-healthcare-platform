#############################################
# S3 Patient Documents Bucket
#############################################

resource "aws_s3_bucket" "patient_documents" {

  bucket = "${var.project_name}-patient-documents-${data.aws_caller_identity.current.account_id}"

  tags = {

    Name = "${var.project_name}-patient-documents"

    Data = "Healthcare Patient Records"

  }

}


#############################################
# Enable Versioning
#############################################

resource "aws_s3_bucket_versioning" "patient_documents" {

  bucket = aws_s3_bucket.patient_documents.id

  versioning_configuration {

    status = "Enabled"

  }

}


#############################################
# Block Public Access
#############################################

resource "aws_s3_bucket_public_access_block" "patient_documents" {

  bucket = aws_s3_bucket.patient_documents.id


  block_public_acls = true

  block_public_policy = true

  ignore_public_acls = true

  restrict_public_buckets = true

}


#############################################
# Bucket Ownership
#############################################

resource "aws_s3_bucket_ownership_controls" "patient_documents" {

  bucket = aws_s3_bucket.patient_documents.id


  rule {

    object_ownership = "BucketOwnerEnforced"

  }

}


#############################################
# Enable KMS Encryption
#############################################

resource "aws_s3_bucket_server_side_encryption_configuration" "patient_documents" {

  bucket = aws_s3_bucket.patient_documents.id


  rule {

    apply_server_side_encryption_by_default {

      kms_master_key_id = aws_kms_key.healthcare.arn

      sse_algorithm = "aws:kms"

    }

  }

}


#############################################
# Force HTTPS Access Only
#############################################

resource "aws_s3_bucket_policy" "secure_transport" {

  bucket = aws_s3_bucket.patient_documents.id


  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Sid = "DenyHTTP"

        Effect = "Deny"

        Principal = "*"

        Action = "s3:*"

        Resource = [

          aws_s3_bucket.patient_documents.arn,

          "${aws_s3_bucket.patient_documents.arn}/*"

        ]

        Condition = {

          Bool = {

            "aws:SecureTransport" = "false"

          }

        }

      }

    ]

  })

}

