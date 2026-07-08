resource "aws_sns_topic" "alerts" {

  name = "${var.project_name}-alerts"

}


resource "aws_cloudwatch_metric_alarm" "ec2_cpu" {


  alarm_name = "${var.project_name}-high-cpu"


  comparison_operator = "GreaterThanThreshold"


  evaluation_periods = 2


  metric_name = "CPUUtilization"


  namespace = "AWS/EC2"


  period = 300


  statistic = "Average"


  threshold = 80


  alarm_actions = [

    aws_sns_topic.alerts.arn

  ]


}
