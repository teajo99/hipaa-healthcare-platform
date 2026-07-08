#############################################
# EC2 IAM Role
#############################################

resource "aws_iam_role" "ec2_role" {

  name = "${var.project_name}-ec2-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })


  tags = {

    Name = "${var.project_name}-ec2-role"

  }

}


#############################################
# Attach AWS Managed SSM Policy
#############################################

resource "aws_iam_role_policy_attachment" "ssm" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}


#############################################
# CloudWatch Permissions
#############################################

resource "aws_iam_role_policy" "cloudwatch" {

  name = "${var.project_name}-cloudwatch-policy"

  role = aws_iam_role.ec2_role.id


  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "logs:CreateLogGroup",

          "logs:CreateLogStream",

          "logs:PutLogEvents"

        ]

        Resource = "*"

      }

    ]

  })

}




#############################################
# Secrets Manager Least Privilege Policy
#############################################

resource "aws_iam_role_policy" "secrets_access" {

  name = "${var.project_name}-secrets-policy"

  role = aws_iam_role.ec2_role.id


  policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Action = [

          "secretsmanager:GetSecretValue"

        ]

        Resource = aws_secretsmanager_secret.database.arn

      }

    ]

  })

}


#############################################
# EC2 Instance Profile
#############################################

resource "aws_iam_instance_profile" "ec2_profile" {

  name = "${var.project_name}-instance-profile"

  role = aws_iam_role.ec2_role.name

}

