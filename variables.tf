variable "prefix" {
  type    = string
  default = "mini-project"
}

variable "subnets" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "security_groups" {
  description = "A map of security groups with their rules"
  type = map(object({
    description = string
    ingress_rules = optional(list(object({
      description = optional(string)
      priority    = optional(number)
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    })))
    egress_rules = list(object({
      description = optional(string)
      priority    = optional(number)
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}

variable "ec2" {
  type = map(object({
    server_name = string
    subnet      = string
  }))
  default = {}
}