variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "kijani-key"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key name"
  type        = string
}

variable "servers" {
  description = "Server definitions"
  type = map(object({
    name = string
  }))
}
