variable "sample" {
  default = "Hello World"
}

output "sample" {
  value = "var.sample"
}

output "sample1" {
  value = "${var.sample} - From Terraform"
}

variable "sample2" {}

output "sample2" {
  value = "var.sample2"
}

variable "string" {
  default = "Hello"
}

variable "number" {
  default = 10
}

variable "boolean" {
  default = false
}

output "data-types" {
  value = "String = ${var.string}, Number = ${var.number} , Boolean = ${var.boolean}"
}

variable "TRAINING" {
  default = "DevOps"
}

variable "TRAININGS" {
  default = [ "Hello" , 100 , true , "World" ]
}

variable "TRAININGS-DETAILS" {
  default = {
    AWS = 6 PM EST
    Devops = 8 AM EST
  }
}

output "TRAINING" {
  value = "var.training"
}

output "FIRST-TRAINING" {
  value = "var.TRAININGS[0]"
}

output "SECOND-TRAINING" {
  value = "var.TRAININGS[1]"
}

output "TRAINING-DETAILS" {
  value = "AWS TIMING - ${var.TRAININGS-DETAILS["AWS"]}"
}

variable "COUNTRIES" {}

output "COUNTRIES" {
  value = "var.COUNTRIES"
}

variable "SEASON" {}

output "SEASON" {
  value = "var.SEASON"
}

variable "FRUITS" {}

output "FRUITS" {
  value = "var.FRUITS"
}


