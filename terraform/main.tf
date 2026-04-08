
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

locals {
  servers = {
    api      = "t3.micro"
    payments = "t3.micro"
    logs     = "t3.micro"
  }
}

module "servers" {
  source         = "./modules/app_server"
  for_each = local.servers

  name           = each.key
  instance_type  = each.value
  ami         = data.aws_ami.ubuntu.id
  key_name       = var.key_name
}
