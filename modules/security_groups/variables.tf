variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_ports" {
  description = "List of ports to open for the public security group"
  type        = list(number)
}

variable "private_ports" {
  description = "List of ports to open for the private security group"
  type        = list(number)
}