variable "aws_region" {
  default = "us-west-2"
}

variable "vpc_cider" {
  default = "10.20.0.0/16"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "subnets_cidr" {
  type    = list
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
  type    = list
  default = ["us-west-2a", "us-west-2b"]
}

variable "ingress_ports" {
  type    = list
  default = ["80", "22"]
}

variable "webserver_ami" {
  default = "ami-0b1e2eeb33ce3d66f"
}

variable "instance_type" {
  default = "t2.micro"
}
