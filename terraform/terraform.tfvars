aws_region    = "us-east-1"
instance_type = "t2.micro"
key_name      = "kijani-key"

servers = {
  api = {
    name = "kk-api"
  }
  payments = {
    name = "kk-payments"
  }
  logs = {
    name = "kk-logs"
  }
}
