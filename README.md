```hcl
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
```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_domain.domain](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/domain) | resource |
| [digitalocean_record.records](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/record) | resource |
| [digitalocean_domain.domain](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/data-sources/domain) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_records"></a> [records](#input\_records) | The records to be created for digital ocean | <pre>list(object({<br>    create_domain     = optional(bool, false)<br>    record_type       = string<br>    record_name       = string<br>    record_value      = string<br>    domain_name       = string<br>    domain_ip_address = optional(string)<br>    port              = optional(number)<br>    priority          = optional(number)<br>    weight            = optional(number)<br>    ttl               = optional(number)<br>    flags             = optional(number)<br>    tag               = optional(string)<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
