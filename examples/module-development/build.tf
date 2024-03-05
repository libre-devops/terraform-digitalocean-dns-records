module "dev" {
  source = "../../"

  records = [
    {
      domain_name  = "libredevops.org"
      record_name  = "www"
      record_type  = "A"
      record_value = "192.168.1.0"
    },
  ]
}
