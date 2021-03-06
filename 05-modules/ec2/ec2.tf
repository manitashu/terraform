resource "aws_instance" "sample" {
  COUNT                      = 2
  ami                        = "ami-0e4e4b2f188e91845"
  instance_type              = var.TYPE
  vpc_security_group_ids     = [var.SG_ID]
  tags                       = {
    Name                     = "Example-${count.index}"
  }
}

variable "SG_ID" {}
variable "TYPE" {}

output "PRIVATE_IP" {
  value = aws_instance.sample.*.private_ip
}