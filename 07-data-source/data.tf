data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  //name_regex       =
  owners           = ["973714476881"]
}

output "amis" {
  value = data.aws_ami.example
}