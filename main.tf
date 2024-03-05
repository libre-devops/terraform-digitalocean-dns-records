data "digitalocean_domain" "domain" {
  for_each = { for k, v in var.records : k => v if v.create_domain == false }
  name     = each.value.domain_name
}

resource "digitalocean_domain" "domain" {
  for_each   = { for k, v in var.records : k => v if v.create_domain == true }
  name       = each.value.domain_name
  ip_address = each.value.domain_ip_address
}

resource "digitalocean_record" "records" {
  for_each = { for k, v in var.records : k => v }
  domain   = each.value.create_domain == true ? digitalocean_domain.domain[each.key].id : data.digitalocean_domain.domain[each.key].id
  type     = each.value.record_type
  name     = each.value.record_name
  value    = each.value.record_value
  port     = each.value.port
  priority = each.value.priority
  weight   = each.value.weight
  ttl      = each.value.ttl
  flags    = each.value.flags
  tag      = each.value.tag
}
