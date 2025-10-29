variable "instance_type" {
  type = string
  description = "type"
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "vpc_id" {
  type = string
}
variable "aws_pub_sub" {
  type= string
}

variable "aws_pvt_sub" {
  type = string
}

variable "ec2_profile" {
  type = string
}