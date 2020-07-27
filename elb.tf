resource "aws_elb" "javahome_elb" {
  name = "javahomeelb"
  //availability_zones = var.azs
  subnets         = aws_subnet.public.*.id
  security_groups = ["${aws_security_group.webserver.id}"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = aws_instance.webserver.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "javahome_elb-terraform-elb"
  }
}

output "elb-dns" {
  value = aws_elb.javahome_elb.dns_name
}
