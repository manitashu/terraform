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