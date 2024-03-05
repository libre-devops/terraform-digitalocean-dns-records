```hcl
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
```
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dev"></a> [dev](#module\_dev) | ../../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
