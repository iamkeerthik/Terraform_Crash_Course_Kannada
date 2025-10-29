variable "env_vars" {
  type = object({
    env        = string
    project    = string
    managed_by = string
  })
}

variable "ec2_instances" {
  type = map(object({
    instance_type = string
    ami           = string
    name          = string
  }))
  default = { }
}
 variable "region" {
   type = string
 }