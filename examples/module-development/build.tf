module "dev" {
  source = "../../"

  records = [
    {
      domain_name  = "thacktech.scot"
      record_name  = "www"
      record_type  = "A"
      record_value = "192.168.1.0"
    },
    {
      create_domain = true
      domain_name   = "cyber.scot"
      record_name   = "www"
      record_type   = "A"
      record_value  = "192.168.1.0"
    },
  ]
}
