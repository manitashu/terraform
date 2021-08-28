//resource "aws_instance" "instances" {
//  ami           = "ami-074df373d6bafa625"
//  instance_type = "t3.micro"
//}

resource "aws_spot_instance_request" "cheap_worker" {
  COUNT         = lenght(var.COMPONENTS)
  ami           = "ami-074df373d6bafa625"
  spot_price    = "0.0031"
  instance_type = "t3.micro"

  tags = {
    Name = element(var.COMPONENTS, count.index)
  }
}



