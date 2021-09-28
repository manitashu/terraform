resource "aws_spot_instance_request" "RoboShop" {
  count                  = local.LENGTH
  ami                    = "ami-074df373d6bafa625"
  spot_price             = "0.0031"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0342f3ac50a4bc8c6"]
  wait_for_fulfillment   = true
//  spot_type              = "persistent"

  tags                   = {
    Name                 = element(var.COMPONENTS, count.index)
  }
}

resource "aws_ec2_tag" "name-tag" {
  count                  = local.LENGTH
  resource_id            = element(aws_spot_instance_request.RoboShop.*.spot_instance_id, count.index)
  key                    = "Name"
  value                  = element(var.COMPONENTS, count.index)
}

output "attributes" {
  value                  = aws_spot_instance_request.RoboShop.*.spot_instance_id
}

resource "aws_route53_record" "records" {
  count   = local.LENGTH
  name    = element(var.COMPONENTS, count.index)
  type    = "A"
  zone_id = "Z03476471IC0ZQ24HHFEZ"
  ttl     = 300
  records = [element(aws_spot_instance_request.RoboShop.*.private_ip, count.index)]
}

resource "null_resource" "run-shell-scripting" {
  depends_on             = [aws_route53_record.records]
  count                  = local.LENGTH
  provisioner "remote-exec" {

    connection {
      host               = element(aws_spot_instance_request.RoboShop.*.public_ip, count.index)
      user               = "centos"
      password           = "DevOps321"
    }

    inline = [
      "cd /home/centos",
      "git clone https://DevOps-Batches@dev.azure.com/DevOps-Batches/DevOps57/_git/shell-scripting",
      "cd shell-scripting/roboshop",
      "sudo make ${element(var.COMPONENTS, count.index)}"
    ]
  }
}

locals {
  LENGTH = length(var.COMPONENTS)
}




