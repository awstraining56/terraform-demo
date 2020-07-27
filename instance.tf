
resource "aws_instance" "webserver" {
  count           = length(var.subnets_cidr)
  ami             = var.webserver_ami
  instance_type   = var.instance_type
  security_groups = ["${aws_security_group.webserver.id}"]
  subnet_id       = element(aws_subnet.public.*.id, count.index)
  key_name        = aws_key_pair.tfdemo.id
  user_data       = file("install_httpd.sh")
  tags = {
    Name = "webserver - ${count.index + 1}"
  }

}
