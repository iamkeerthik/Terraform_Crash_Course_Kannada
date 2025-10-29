variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_name" {
  default = "demo-vpc"
}

variable "cidr_block" {

}

variable "instance_type" {
  default = "t2.micro"
}

variable "pub_cidr" {
  type = string
}

variable "pvt_cidr" {
  type = string
}

variable "key_name" {
  
}
