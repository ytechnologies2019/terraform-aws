## vpc/variables.tf
# variable "vpc_cidr" {
#   type = string
# }

variable "aws_region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "allocated_storage" {
  type = number
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}

variable "parameter_group_name" {
    type = string
}

variable "skip_final_snapshot" {
    type = bool
}