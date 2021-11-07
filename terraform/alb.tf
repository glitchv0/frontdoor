resource "aws_alb" "frontdoor" {
  
  name                = "test-frontdoor"
  internal            = false
  security_groups     = ["${aws_security_group.frontdoor.id}"]
  subnets             = ["${aws_subnet.frontdoor.id}"]
  idle_timeout       = 60
  enable_deletion_protection = false
  enable_ip_forwarding = false
  enable_customer_ip_tcp_reset = false
  access_logs_enabled = false
  access_logs_s3_bucket = ""
  access_logs_s3_prefix = ""
  access_logs_s3_enabled = false
  default_action {
    target_group_arn = "${aws_alb_target_group.test.id}"
    type = "forward"
  }
}