output "server_ips" {
  value = {
    for k, v in module.servers : k => v.public_ip
  }
}


# Individual outputs for Requirement 3 (The Pipeline Script)
output "api_ip" {
  value = module.app_servers["api"].public_ip
}

output "payments_ip" {
  value = module.app_servers["payments"].public_ip
}

output "logs_ip" {
  value = module.app_servers["logs"].public_ip
}
