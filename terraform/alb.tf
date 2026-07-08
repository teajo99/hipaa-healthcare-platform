#############################################
# Application Load Balancer
#############################################

resource "aws_lb" "healthcare" {

  name = "${var.project_name}-alb"

  internal = false

  load_balancer_type = "application"


  security_groups = [

    aws_security_group.alb.id

  ]


  subnets = [

    aws_subnet.public_a.id,
    aws_subnet.public_b.id

  ]


  tags = {

    Name = "${var.project_name}-alb"

  }

}



#############################################
# Target Group
#############################################

resource "aws_lb_target_group" "healthcare" {


  name = "${var.project_name}-tg"


  port = 80


  protocol = "HTTP"


  vpc_id = aws_vpc.main.id



  health_check {

    enabled = true

    path = "/"

    port = "80"

    protocol = "HTTP"

  }


}



#############################################
# Attach EC2 to Target Group
#############################################

resource "aws_lb_target_group_attachment" "healthcare" {


  target_group_arn = aws_lb_target_group.healthcare.arn


  target_id = aws_instance.healthcare_app.id


  port = 80


}



#############################################
# Listener
#############################################

resource "aws_lb_listener" "http" {


  load_balancer_arn = aws_lb.healthcare.arn


  port = 80


  protocol = "HTTP"



  default_action {


    type = "forward"


    target_group_arn = aws_lb_target_group.healthcare.arn


  }

}
