#############################################
# EC2 Application Server
#############################################

resource "aws_instance" "healthcare_app" {

  ami = var.ami_id

  instance_type = "t3.micro"

  subnet_id = aws_subnet.private_a.id

  vpc_security_group_ids = [
    aws_security_group.ec2.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name


  associate_public_ip_address = false


  user_data = <<-EOF
              #!/bin/bash

              yum update -y

              yum install -y python3 git

              mkdir -p /opt/healthcare-app

              echo "HIPAA Healthcare Platform Running" > /opt/healthcare-app/index.html

              EOF


  root_block_device {

    encrypted = true

    kms_key_id = aws_kms_key.healthcare.arn

    volume_size = 20

  }


  tags = {

    Name = "${var.project_name}-application-server"

    Environment = "Production"

  }

}
